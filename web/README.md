# SafeSpace - Web Application

A comprehensive Next.js web application that mirrors the functionality of the SafeSpace Flutter mobile app, providing an optimized experience for desktop, tablet, and mobile web browsers.

## Overview

SafeSpace is a digital wellness and parental control application designed to help families maintain healthy digital habits. The platform offers separate interfaces and features for both parents and children.

## Features

### Parent Dashboard
- **Home Dashboard**: Overview of child's wellness metrics
- **Reports**: Weekly/monthly analytics with downloadable PDFs
- **App Usage**: Detailed breakdown of app usage by category
- **Sleep Tracking**: Sleep patterns and quality analysis
- **Mood Monitoring**: Child's mood entries and trends
- **Screen Time Management**: Session history and limits
- **Habits Overview**: Progress tracking for daily habits
- **Settings**: Comprehensive configuration options

### Child Dashboard
- **Home**: Quick wellness overview and mood check
- **Journal**: Mood entry tracking with privacy controls
- **Habits**: Daily habit progress tracking
- **Screen Time**: Usage monitoring and app breakdown
- **Sleep**: Sleep logging and quality rating
- **Breaks**: Break reminders and activity suggestions
- **Settings**: Profile and privacy management

## Tech Stack

- **Framework**: Next.js 14+ (App Router)
- **Language**: TypeScript (strict mode)
- **Styling**: Tailwind CSS
- **State Management**: Zustand
- **Authentication**: Firebase Auth (Email/Password)
- **Database**: Firebase Firestore (Real-time)
- **Charts**: Recharts
- **Icons**: Lucide React
- **Form Management**: React Hook Form + Zod
- **Deployment**: Vercel/Firebase Hosting

## Project Structure

```
safespace/
├── src/
│   ├── app/
│   │   ├── layout.tsx
│   │   ├── page.tsx
│   │   ├── (auth)/
│   │   │   ├── login/page.tsx
│   │   │   └── signup/page.tsx
│   │   ├── (parent)/
│   │   │   ├── dashboard/page.tsx
│   │   │   ├── reports/page.tsx
│   │   │   ├── app-usage/page.tsx
│   │   │   ├── sleep/page.tsx
│   │   │   ├── mood/page.tsx
│   │   │   ├── screen-time/page.tsx
│   │   │   ├── habits/page.tsx
│   │   │   └── settings/page.tsx
│   │   ├── (child)/
│   │   │   ├── dashboard/page.tsx
│   │   │   ├── journal/page.tsx
│   │   │   ├── habits/page.tsx
│   │   │   ├── screen-time/page.tsx
│   │   │   ├── sleep/page.tsx
│   │   │   ├── breaks/page.tsx
│   │   │   └── settings/page.tsx
│   │   └── api/
│   ├── components/
│   │   ├── auth/
│   │   │   ├── LoginForm.tsx
│   │   │   └── SignupForm.tsx
│   │   ├── charts/
│   │   │   ├── ChartComponents.tsx
│   │   │   └── StatCard.tsx
│   │   ├── common/
│   │   │   ├── Button.tsx
│   │   │   ├── Card.tsx
│   │   │   ├── LayoutWrapper.tsx
│   │   │   ├── LoadingSpinner.tsx
│   │   │   └── Notification.tsx
│   │   ├── parent/ (future components)
│   │   ├── child/ (future components)
│   │   ├── forms/ (future components)
│   │   └── modals/ (future components)
│   ├── hooks/
│   │   ├── useFirestore.ts
│   │   └── useResponsive.ts
│   ├── lib/
│   │   ├── firebase.ts
│   │   ├── auth.ts
│   │   ├── db.ts
│   │   └── utils.ts
│   ├── store/
│   │   ├── authStore.ts
│   │   ├── userDataStore.ts
│   │   └── uiStore.ts
│   ├── types/
│   │   └── index.ts
│   ├── styles/
│   │   ├── globals.css
│   │   └── theme.ts
│   └── middleware.ts
├── public/
├── .env.example
├── .env.local (not committed)
├── next.config.js
├── tailwind.config.ts
├── tsconfig.json
├── package.json
└── README.md
```

## Installation

### Prerequisites
- Node.js 18+ and npm/yarn
- Firebase project account

### Setup Steps

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/safespace-web.git
   cd safespace-web
   ```

2. **Install dependencies**
   ```bash
   npm install
   ```

3. **Configure Firebase**
   - Copy `.env.example` to `.env.local`
   - Add your Firebase credentials:
   ```env
   NEXT_PUBLIC_FIREBASE_API_KEY=your_api_key
   NEXT_PUBLIC_FIREBASE_AUTH_DOMAIN=your_auth_domain
   NEXT_PUBLIC_FIREBASE_PROJECT_ID=your_project_id
   NEXT_PUBLIC_FIREBASE_STORAGE_BUCKET=your_storage_bucket
   NEXT_PUBLIC_FIREBASE_MESSAGING_SENDER_ID=your_sender_id
   NEXT_PUBLIC_FIREBASE_APP_ID=your_app_id
   ```

4. **Run development server**
   ```bash
   npm run dev
   ```
   Visit `http://localhost:3000`

## Environment Variables

Create a `.env.local` file with:

```env
# Firebase Configuration
NEXT_PUBLIC_FIREBASE_API_KEY=xxx
NEXT_PUBLIC_FIREBASE_AUTH_DOMAIN=xxx.firebaseapp.com
NEXT_PUBLIC_FIREBASE_PROJECT_ID=xxx
NEXT_PUBLIC_FIREBASE_STORAGE_BUCKET=xxx.appspot.com
NEXT_PUBLIC_FIREBASE_MESSAGING_SENDER_ID=xxx
NEXT_PUBLIC_FIREBASE_APP_ID=xxx
NEXT_PUBLIC_FIREBASE_MEASUREMENT_ID=xxx

# API Configuration
NEXT_PUBLIC_API_URL=http://localhost:3000

# Environment
NODE_ENV=development
```

## Color Palette

- **Primary Orange**: #F5A962
- **Secondary Purple**: #CDB4DB
- **Warning Yellow**: #FFF3CD
- **Success Green**: #D4EDDA
- **Accent Blue**: #6C9BCF
- **Status Red**: #E57373
- **Status Green**: #81C784
- **Background**: #F8F9FA
- **Text Dark**: #212529
- **Text Light**: #6C757D

## Responsive Design

### Mobile (320px - 768px)
- Stack layout
- Hamburger navigation
- Touch-friendly buttons (48px min)
- Single column layout

### Tablet (768px - 1024px)
- Two-column layouts
- Side navigation drawer
- Optimized card sizing

### Desktop (1024px+)
- Three-column layouts
- Permanent sidebar
- Multiple widgets per row
- Large charts

## Database Structure (Firestore)

### Users Collection
```
users/{userId}
├── name: string
├── email: string
├── isParent: boolean
├── childId: string | null
├── createdAt: timestamp
└── updatedAt: timestamp
```

### Subcollections
- `mood_entries/`: Mood tracking data
- `sleep_data/`: Sleep logs
- `app_usage/`: App usage statistics
- `screen_time/`: Screen sessions
- `habits/`: Daily habit tracking
- `settings/`: User preferences

## Authentication Flow

1. **Login/Signup**: Email/Password via Firebase Auth
2. **Protected Routes**: Middleware checks authentication
3. **Role-based Access**: Parent vs Child routing
4. **Session Management**: Firebase session persistence

## State Management

### Zustand Stores
- `authStore`: Authentication state and actions
- `userDataStore`: User data (moods, sleep, habits, etc.)
- `uiStore`: UI state (sidebar, notifications, etc.)

### Custom Hooks
- `useAuth()`: Authentication operations
- `useUserData()`: User data operations
- `useResponsive()`: Responsive design detection
- `useMoodEntries()`: Real-time mood data
- `useSleepData()`: Real-time sleep data
- `useAppUsage()`: Real-time app usage
- `useHabits()`: Real-time habit tracking

## API Endpoints (Future)

- `POST /api/auth/login`: User login
- `POST /api/auth/signup`: User registration
- `POST /api/auth/logout`: User logout
- `GET /api/user/profile`: Get user profile
- `PUT /api/user/profile`: Update profile
- `GET /api/reports/generate`: Generate PDF report
- `POST /api/mood/create`: Create mood entry
- `GET /api/mood/list`: List mood entries

## Running Locally

### Development
```bash
npm run dev
```

### Build
```bash
npm run build
```

### Production
```bash
npm start
```

## Deployment

### Vercel (Recommended)

1. **Connect GitHub repository**
   ```bash
   vercel
   ```

2. **Set environment variables** in Vercel dashboard

3. **Deploy**
   ```bash
   vercel --prod
   ```

### Firebase Hosting

1. **Install Firebase CLI**
   ```bash
   npm install -g firebase-tools
   ```

2. **Build project**
   ```bash
   npm run build
   ```

3. **Deploy**
   ```bash
   firebase deploy
   ```

## Testing

```bash
# Run tests
npm test

# Run tests in watch mode
npm test -- --watch

# Generate coverage report
npm test -- --coverage
```

## Security Notes

- Firebase Authentication handles user security
- Firestore security rules restrict data access
- Environment variables protect sensitive data
- HTTPS enforced in production
- XSS protection via React
- CSRF protection via Next.js

## Browser Support

- Chrome (latest)
- Firefox (latest)
- Safari (latest)
- Edge (latest)
- Mobile browsers (iOS Safari, Chrome Android)

## Performance Optimization

- Code splitting with Next.js dynamic imports
- Image optimization
- Firestore query optimization
- Caching strategies
- Server-side rendering where appropriate

## Troubleshooting

### Firebase Connection Issues
- Verify API keys in `.env.local`
- Check Firestore security rules
- Ensure CORS is configured

### Authentication Errors
- Clear browser cache and cookies
- Verify email format
- Check Firebase console for errors

### Build Errors
- Delete `node_modules` and `.next` directories
- Run `npm install` again
- Check TypeScript errors: `npm run type-check`

## Contributing

1. Create a feature branch: `git checkout -b feature/AmazingFeature`
2. Commit changes: `git commit -m 'Add AmazingFeature'`
3. Push to branch: `git push origin feature/AmazingFeature`
4. Open a Pull Request

## License

MIT License - See LICENSE file for details

## Support

For support, email support@safespace.app or open an issue on GitHub.

## Roadmap

- [ ] Email notifications
- [ ] Browser push notifications
- [ ] PDF report generation
- [ ] CSV export functionality
- [ ] Dark mode theme
- [ ] Progressive Web App (PWA)
- [ ] Offline support
- [ ] AI-powered insights
- [ ] Multi-language support
- [ ] Advanced analytics

## Authors

- Created: 2026
- Version: 1.0.0

## Acknowledgments

- Built with Next.js and Tailwind CSS
- Charts powered by Recharts
- Authentication by Firebase
- Icons by Lucide React

This project uses [`next/font`](https://nextjs.org/docs/app/building-your-application/optimizing/fonts) to automatically optimize and load [Geist](https://vercel.com/font), a new font family for Vercel.

## Learn More

To learn more about Next.js, take a look at the following resources:

- [Next.js Documentation](https://nextjs.org/docs) - learn about Next.js features and API.
- [Learn Next.js](https://nextjs.org/learn) - an interactive Next.js tutorial.

You can check out [the Next.js GitHub repository](https://github.com/vercel/next.js) - your feedback and contributions are welcome!

## Deploy on Vercel

The easiest way to deploy your Next.js app is to use the [Vercel Platform](https://vercel.com/new?utm_medium=default-template&filter=next.js&utm_source=create-next-app&utm_campaign=create-next-app-readme) from the creators of Next.js.

Check out our [Next.js deployment documentation](https://nextjs.org/docs/app/building-your-application/deploying) for more details.
