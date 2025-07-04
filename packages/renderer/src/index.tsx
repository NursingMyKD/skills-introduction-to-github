import React from 'react';
import { createRoot } from 'react-dom/client';

function App() {
  return (
    <div className="p-4">
      <h1 className="text-2xl font-bold">ICU Staffing Dashboard</h1>
      <p>Welcome to the offline dashboard.</p>
    </div>
  );
}

const root = createRoot(document.getElementById('root')!);
root.render(<App />);
