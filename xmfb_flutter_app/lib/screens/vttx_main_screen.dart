import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../models/user_data.dart';
import '../providers/theme_provider.dart';


class VTTXMainScreen extends StatefulWidget {
  const VTTXMainScreen({Key? key}) : super(key: key);

  @override
  State<VTTXMainScreen> createState() => _VTTXMainScreenState();
}

class _VTTXMainScreenState extends State<VTTXMainScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _messageController = TextEditingController();
  double _chatWindowHeight = 230.0; // Default chat window height
  final double _minChatWindowHeight = 100.0;
  final double _maxChatWindowHeight = 450.0;
  bool _isResizingVideoChat = false;
  int _selectedTabIndex = 0;
  double _dragStartPositionY = 0.0;
  double _dragStartHeight = 0.0;
  
  // Define users with different color themes
  final List<UserData> _users = [
    UserData(
      name: 'Sarah Johnson', 
      status: UserStatus.online,
      identifyingColor: const Color(0xFF4CAF50), // Green
    ),
    UserData(
      name: 'Mike Chen', 
      status: UserStatus.online,
      identifyingColor: const Color(0xFF2196F3), // Blue
    ),
    UserData(
      name: 'Aisha Patel', 
      status: UserStatus.offline,
      identifyingColor: const Color(0xFFF44336), // Red
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _users.length, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedTabIndex = _tabController.index;
        // Update theme based on selected user
        Provider.of<ThemeProvider>(context, listen: false)
            .setUserTheme(_users[_selectedTabIndex]);
      });
    });
    
    // Set initial theme
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ThemeProvider>(context, listen: false)
          .setUserTheme(_users[0]);
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _showSideMenu(BuildContext context, bool isLeftMenu) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.7,
        maxChildSize: 0.9,
        minChildSize: 0.5,
        builder: (_, controller) => Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Handle bar for dragging
              Center(
                child: Container(
                  width: 40,
                  height: 5,
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    isLeftMenu ? 'People' : 'Settings',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              if (isLeftMenu) _buildPeopleMenu(controller) else _buildSettingsMenu(controller),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPeopleMenu(ScrollController controller) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    
    return Expanded(
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Search people...',
              prefixIcon: Icon(Icons.search, color: themeProvider.primaryColor),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Theme.of(context).colorScheme.surface,
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              controller: controller,
              itemCount: 15,
              itemBuilder: (context, index) {
                final bool isOnline = index % 3 != 2;
                return ListTile(
                  leading: Stack(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                          "https://pixabay.com/get/g1c5d84330da32b1e72ea09e3cff4b8b18df8208e2a3d96e5c3d221083344ad8e71b3a575c655a34116ccedc727f50c85c64f23fe799026bdbd7ae0c1742b674a_1280.jpg",
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isOnline ? Colors.green : Colors.grey,
                            border: Border.all(color: Theme.of(context).cardColor, width: 2),
                          ),
                        ),
                      ),
                    ],
                  ),
                  title: Text('Person ${index + 1}'),
                  subtitle: Text(isOnline ? 'Active now' : 'Last seen today'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsMenu(ScrollController controller) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    
    return Expanded(
      child: ListView(
        controller: controller,
        children: [
          ListTile(
            leading: Icon(Icons.dark_mode, color: themeProvider.primaryColor),
            title: const Text('Dark Mode'),
            trailing: Switch(
              value: Theme.of(context).brightness == Brightness.dark,
              activeColor: themeProvider.primaryColor,
              onChanged: (value) {
                themeProvider.toggleThemeMode();
              },
            ),
          ),
          ListTile(
            leading: Icon(Icons.video_settings, color: themeProvider.primaryColor),
            title: const Text('Video Settings'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.chat, color: themeProvider.primaryColor),
            title: const Text('Chat Settings'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.notifications, color: themeProvider.primaryColor),
            title: const Text('Notifications'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.help_outline, color: themeProvider.primaryColor),
            title: const Text('Help & Support'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text('Sign Out', style: TextStyle(color: Colors.red)),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final double screenHeight = MediaQuery.of(context).size.height;
    final double safeAreaTop = MediaQuery.of(context).padding.top;
    final double safeAreaBottom = MediaQuery.of(context).padding.bottom;
    final double appBarHeight = 42.0;
    final double tabBarHeight = 60.0;
    final double messageInputHeight = 65.0;
    
    // Calculate video window height based on available space
    final double availableHeight = screenHeight - safeAreaTop - safeAreaBottom - 
                                   appBarHeight - tabBarHeight - messageInputHeight;
    final double videoWindowHeight = availableHeight - _chatWindowHeight;
    
    return Scaffold(
      backgroundColor: themeProvider.getBackgroundColor(context),
      body: SafeArea(
        child: Column(
          children: [
            // Header Bar with gradient background
            _buildHeaderBar(),
            
            // Video display
            SizedBox(
              height: videoWindowHeight,
              child: _buildVideoWindow(),
            ),
            
            // Resizable divider between video and chat
            GestureDetector(
              onVerticalDragStart: (details) {
                _isResizingVideoChat = true;
                _dragStartPositionY = details.globalPosition.dy;
                _dragStartHeight = _chatWindowHeight;
              },
              onVerticalDragUpdate: (details) {
                if (!_isResizingVideoChat) return;
                
                final double dragDistance = _dragStartPositionY - details.globalPosition.dy;
                setState(() {
                  _chatWindowHeight = (_dragStartHeight + dragDistance).clamp(
                    _minChatWindowHeight,
                    availableHeight - 150 // Ensure there's always space for the video
                  );
                });
              },
              onVerticalDragEnd: (_) {
                _isResizingVideoChat = false;
              },
              child: Container(
                width: double.infinity,
                height: 24,
                color: Colors.transparent,
                child: Center(
                  child: Container(
                    width: 80,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
            ),
            
            // User tabs (browser-like)
            _buildUserTabs(),
            
            // Chat Window (expandable)
            SizedBox(
              height: _chatWindowHeight,
              child: _buildChatWindow(),
            ),
            
            // Message input
            _buildMessageInput(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderBar() {
    final themeProvider = Provider.of<ThemeProvider>(context);
    
    return Container(
      height: 42,
      decoration: BoxDecoration(
        gradient: themeProvider.currentGradient,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left menu button
          IconButton(
            icon: const Icon(Icons.people, color: Colors.white, size: 20),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            onPressed: () => _showSideMenu(context, true),
          ),
          
          // App title
          Text(
            'VTTX Chat',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          
          // Right menu button
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white, size: 20),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            onPressed: () => _showSideMenu(context, false),
          ),
        ],
      ),
    );
  }

  Widget _buildVideoWindow() {
    final themeProvider = Provider.of<ThemeProvider>(context);
    
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Main video feed
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              "https://pixabay.com/get/g73422260b1651754de51d6048ac180bfb0a073119002554cfae7cabb1cb6a7fcab10fbd28ffefb0269e86bd295c68451d79c41967df141a304123f45d550bb7f_1280.jpg",
              fit: BoxFit.cover,
            ),
          ),
          
          // PIP self-view
          Positioned(
            top: 8,
            right: 8,
            child: Container(
              width: 100,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: themeProvider.primaryColor, width: 2),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  "https://pixabay.com/get/ga2e9f7abe86500f114c0accb01801a8641a92fe83867c3243425c54780713dc09c88aa2e319616304ac3b1eb2bb767440dd16b954fecb12e67090ebc34345fc8_1280.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserTabs() {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: TabBar(
        controller: _tabController,
        indicator: const BoxDecoration(),
        labelPadding: EdgeInsets.zero,
        tabs: List.generate(_users.length, (index) {
          final user = _users[index];
          final isSelected = _selectedTabIndex == index;
          return _buildTab(user, isSelected);
        }),
      ),
    );
  }
  
  Widget _buildTab(UserData user, bool isSelected) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: isSelected ? LinearGradient(
          colors: [
            user.identifyingColor.withOpacity(0.1),
            user.identifyingColor.withOpacity(0.2),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ) : null,
        border: Border.all(
          color: isSelected ? user.identifyingColor : Colors.transparent,
          width: 1,
        ),
      ),
      child: Tab(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // User avatar with status indicator
            Stack(
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundImage: NetworkImage(
                    "https://pixabay.com/get/gc12fb340a446b4429d6f0fc434a2badc365caae2bee39cff567b04afe7bab81dd214665099c426e9229ebbccd3943dd033c974573fec65555a375b26139c2e09_1280.jpg",
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: user.status == UserStatus.online ? Colors.green : Colors.grey,
                      border: Border.all(color: Theme.of(context).cardColor, width: 2),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                user.name,
                style: TextStyle(
                  color: isSelected ? user.identifyingColor : Theme.of(context).textTheme.bodyMedium?.color,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChatWindow() {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 2,
            offset: const Offset(0, -1),
          ),
        ],
      ),
      margin: const EdgeInsets.fromLTRB(8, 0, 8, 8),
      child: TabBarView(
        controller: _tabController,
        children: List.generate(_users.length, (index) {
          return _buildChatMessages(_users[index]);
        }),
      ),
    );
  }

  Widget _buildChatMessages(UserData user) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 8,
      reverse: true,
      itemBuilder: (context, index) {
        final bool isMe = index % 2 == 0;
        return _buildMessageBubble(user, isMe, index);
      },
    );
  }
  
  Widget _buildMessageBubble(UserData user, bool isMe, int index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isMe) ...[  
            CircleAvatar(
              radius: 16,
              backgroundImage: NetworkImage(
                "https://pixabay.com/get/ge9032f542ec7413f22748dd1817e0c9efa7e1e75df28af5c112aa00620c8ac17d76c83fca6575dd0ec6d56dd1528305c847aa2d2b102067a7e756ee454a819cf_1280.jpg",
              ),
            ),
            const SizedBox(width: 8),
          ],
          
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                gradient: isMe ? LinearGradient(
                  colors: [
                    user.identifyingColor,
                    user.identifyingColor.withOpacity(0.8),
                  ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ) : null,
                color: isMe ? null : Theme.of(context).brightness == Brightness.dark 
                  ? Colors.grey.shade800 
                  : Colors.grey.shade200,
                borderRadius: BorderRadius.circular(16).copyWith(
                  topRight: isMe ? const Radius.circular(4) : null,
                  topLeft: !isMe ? const Radius.circular(4) : null,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Message ${8 - index}. ' + (index % 3 == 0 ? 'This is a longer message to show how text wrapping works in this modern chat UI.' : 'Short message.'),
                    style: TextStyle(
                      color: isMe ? Colors.white : null,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '${10-index}:${(index * 7) % 60 < 10 ? "0" : ""}${(index * 7) % 60}',
                        style: TextStyle(
                          fontSize: 10,
                          color: isMe ? Colors.white.withOpacity(0.7) : Colors.grey,
                        ),
                      ),
                      if (isMe) ...[  
                        const SizedBox(width: 4),
                        Icon(
                          Icons.done_all,
                          size: 12,
                          color: user.status == UserStatus.online 
                              ? Colors.white 
                              : Colors.white.withOpacity(0.7),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageInput() {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final currentUser = _users[_selectedTabIndex];
    
    return Container(
      height: 65,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 3,
            offset: const Offset(0, -1),
          ),
        ],
      ),
      child: Row(
        children: [
          // Attachment button
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: themeProvider.primaryColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: Icon(Icons.add, color: themeProvider.primaryColor),
              onPressed: () {},
              padding: EdgeInsets.zero,
              iconSize: 22,
            ),
          ),
          
          const SizedBox(width: 8),
          
          // Text input field
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.dark 
                  ? Colors.grey.shade800 
                  : Colors.grey.shade200,
                borderRadius: BorderRadius.circular(24),
              ),
              child: TextField(
                controller: _messageController,
                decoration: InputDecoration(
                  hintText: 'Message ${currentUser.name}...',
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.emoji_emotions_outlined, color: themeProvider.primaryColor),
                    onPressed: () {},
                    iconSize: 22,
                    padding: EdgeInsets.zero,
                  ),
                ),
              ),
            ),
          ),
          
          const SizedBox(width: 8),
          
          // Send button
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              gradient: themeProvider.currentGradient,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.send, color: Colors.white),
              padding: EdgeInsets.zero,
              iconSize: 22,
              onPressed: () {
                if (_messageController.text.trim().isNotEmpty) {
                  _messageController.clear();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}