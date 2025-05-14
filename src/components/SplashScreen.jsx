import React, { useState, useEffect } from 'react';

export default function SplashScreen() {
  const [step, setStep] = useState(0);

  // Handle step progression
  useEffect(() => {
    if (step === 1) {
      setTimeout(() => setStep(2), 3000); // Show "the power of together"
    } else if (step === 2) {
      setTimeout(() => setStep(3), 2000); // Show "press any key"
    }
  }, [step]);

  // Advance to step 1 when video ends
  const handleVideoEnd = () => {
    setStep(1);
  };

  return (
    <div className="relative w-screen h-screen overflow-hidden bg-black">
      <video
        src="/splash-final.mp4"
        autoPlay
        muted
        playsInline
        onEnded={handleVideoEnd}
        className="absolute inset-0 w-full h-full object-cover z-0"
      />

      {/* Debug step overlay — remove when done */}
      <div className="absolute top-4 left-4 z-50 text-white text-xs">
        step: {step}
      </div>

      <div className="absolute inset-x-0 bottom-24 md:bottom-32 text-center z-10 text-white font-sans px-4">
        {step >= 1 && (
          <div className={`text-5xl transition-opacity duration-1000 ${step === 1 ? 'opacity-100' : 'opacity-0'}`}>
            XMFB
          </div>
        )}

        {step >= 2 && (
          <div className="mt-6 text-2xl opacity-100 transition-opacity duration-1000">
            the power of together
          </div>
        )}

        {step >= 3 && (
          <div className="mt-8 text-sm opacity-100 transition-opacity duration-1000">
            press any key to begin
          </div>
        )}
      </div>
    </div>
  );
}
