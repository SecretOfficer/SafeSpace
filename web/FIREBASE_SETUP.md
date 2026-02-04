# Firebase Integration Setup Guide

## Steps to Connect Firebase

### 1. Get Your Firebase Credentials
1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Create a new project or select existing one
3. Go to Project Settings → General
4. Scroll down and copy your Web SDK configuration

### 2. Update .env.local
Replace the placeholder values in `.env.local` with your Firebase credentials:

```
NEXT_PUBLIC_FIREBASE_API_KEY=your_api_key
NEXT_PUBLIC_FIREBASE_AUTH_DOMAIN=your_project.firebaseapp.com
NEXT_PUBLIC_FIREBASE_PROJECT_ID=your_project_id
NEXT_PUBLIC_FIREBASE_STORAGE_BUCKET=your_project.appspot.com
NEXT_PUBLIC_FIREBASE_MESSAGING_SENDER_ID=your_sender_id
NEXT_PUBLIC_FIREBASE_APP_ID=your_app_id
```

### 3. Enable Firebase Services
- **Authentication**: Enable Email/Password authentication
- **Firestore Database**: Create a database in production mode
- **Storage**: Enable Cloud Storage (optional, for profile pictures)

### 4. Set Firestore Security Rules
Replace your Firestore rules with:

```firestore
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // User profiles
    match /users/{userId} {
      allow read, write: if request.auth.uid == userId;
      
      // User subcollections
      match /{document=**} {
        allow read, write: if request.auth.uid == userId;
      }
    }
  }
}
```

### 5. Database Structure
The app expects this Firestore structure:

```
users/
  {userId}/
    - name
    - email
    - isParent (boolean)
    - childId (optional, for child accounts)
    mood_entries/
      {entryId}/
        - mood
        - note
        - date
        - isShared
        - createdAt
    screen_time/
      {sessionId}/
        - appName
        - duration
        - date
        - createdAt
    sleep_data/
      {sleepId}/
        - hours
        - status
        - date
        - createdAt
    habits/
      {habitId}/
        - name
        - icon
        - current
        - target
        - unit
    settings/
      preferences/
        - dailyScreenTimeLimit
        - notificationsEnabled
        - dailyReportsEnabled
        - screenTimeAlerts
        - bedtimeReminders
```

### 6. Restart Development Server
After updating `.env.local`, restart the dev server:

```bash
npm run dev
```

### 7. Test Firebase Connection
1. Go to login page
2. The app should now connect to your Firebase project
3. Try creating an account and logging in

## Data Models

### User
```typescript
interface User {
  id: string;
  name: string;
  email: string;
  isParent: boolean;
  childId?: string;
}
```

### Mood Entry
```typescript
interface MoodEntry {
  mood: string; // 'happy', 'sad', 'neutral', etc.
  note?: string;
  date: Date;
  isShared: boolean;
  createdAt: Timestamp;
}
```

### Screen Time Session
```typescript
interface ScreenTimeSession {
  appName: string;
  duration: number; // in minutes
  date: Date;
  category: string; // 'social', 'game', 'education'
}
```

### Sleep Data
```typescript
interface SleepData {
  hours: number;
  status: string; // 'great', 'good', 'poor'
  date: Date;
  notes?: string;
}
```

### Habit
```typescript
interface Habit {
  name: string;
  icon: string;
  current: number;
  target: number;
  unit: string; // 'days', 'min', 'hours'
  completed: boolean;
}
```

## Firebase Service Functions

The app uses these Firebase functions (in `src/services/firebaseService.ts`):

- **getMoodEntries()** - Fetch mood journal entries
- **addMoodEntry()** - Add new mood entry
- **onMoodEntriesChange()** - Real-time mood updates

- **getScreenTimeData()** - Fetch screen time data
- **addScreenTimeEntry()** - Log screen time
- **onScreenTimeChange()** - Real-time screen time updates

- **getSleepData()** - Fetch sleep logs
- **addSleepEntry()** - Log sleep
- **onSleepDataChange()** - Real-time sleep updates

- **getHabits()** - Fetch user habits
- **addHabit()** - Create new habit
- **updateHabit()** - Update habit progress
- **onHabitsChange()** - Real-time habit updates

## Troubleshooting

### "Invalid API Key" Error
- Verify your API key is correct in `.env.local`
- Check that the API key is enabled in Firebase Console
- Make sure CORS is configured properly

### Authentication Not Working
- Verify Email/Password auth is enabled in Firebase Console
- Check Firestore rules allow creating users

### Data Not Syncing
- Check Firestore rules allow reading/writing to collections
- Verify user document exists in Firestore
- Check browser console for errors

### Firestore Not Connected
- Verify project ID matches in `.env.local`
- Check Firestore database is created
- Verify security rules are not blocking requests
