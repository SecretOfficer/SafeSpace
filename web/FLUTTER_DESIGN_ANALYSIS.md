# SafeSpace Flutter App - Comprehensive Design Documentation

## Executive Summary

SafeSpace is a family-oriented digital wellness application that monitors and promotes healthy device usage habits for children. The app features a dual-interface approach with separate, optimized UIs for parents and children, utilizing a Material Design 3 aesthetic with custom color theming.

---

## 1. Architecture Overview

### Entry Point: main.dart
- **App Name**: SafeSpace
- **Theme**: Material Design 3 with custom color scheme
- **State Management**: Provider pattern with ChangeNotifier
- **Navigation**: Named routes with MaterialApp
- **Initial Route**: LoginScreen

### UserProvider Class
The app uses a global UserProvider to manage:
- `_isParent: bool` - Determines if user is parent (true) or child (false)
- `_childName: String` - Name of monitored child (default: "Aarav")
- Methods to update both properties and notify listeners

---

## 2. Color System & Theme

### Primary Colors
```
primaryOrange   #F5A962  → Screen time warnings, alerts
primaryPurple   #CDB4DB  → Primary accent, headers, focus states
primaryYellow   #FFF3CD  → Sleep scores, informational backgrounds
primaryGreen    #D4EDDA  → Mood summaries, positive states
accentBlue      #6C9BCF  → Charts, data visualization
warningRed      #E57373  → Negative indicators, errors
successGreen    #81C784  → Success messages, completed goals
deepPurple      #7C4DFF  → Buttons, critical CTAs
```

### Typography
- **Font Family**: Google Fonts - Roboto
- **Headings**: Bold, sizes 22-32px
- **Body Text**: Regular weight, sizes 12-16px
- **Default Text Color**: #333333 (dark grey)
- **Secondary Text**: #999999 (medium grey)

### Spacing System
- Extra Small: 4px
- Small: 8px
- Medium: 12px
- Large: 16px
- Extra Large: 20px
- Huge: 24px
- Massive: 48px

### Border Radius
- Small: 8px (input fields, buttons)
- Medium: 12px (cards, tiles)
- Large: 16px (cards)
- Extra Large: 20px
- Circular: 28px (dialogs)

---

## 3. Navigation Structure

### Route Map
```
/login          → LoginScreen (entry point)
/parent         → ParentDashboard
/child          → ChildDashboard
```

### BottomNavigationBar Pattern
Both parent and child dashboards use a 3-tab BottomNavigationBar:

**Parent Navigation**:
- Tab 0: Home (dashboard overview)
- Tab 1: Reports (analytics)
- Tab 2: Settings (configuration)

**Child Navigation**:
- Tab 0: Dashboard
- Tab 1: Journal (mood tracking)
- Tab 2: Habits (goal tracking)

Tabs are implemented using IndexedStack or conditional widgets for smooth transitions.

---

## 4. Login Screen

### Layout Structure
```
SafeArea
└── SingleChildScrollView
    └── Column
        ├── Logo (Icon.shield_rounded, size: 80, color: #7C4DFF)
        ├── Title ("SafeSpace", headlineLarge, bold)
        ├── Subtitle ("Digital Wellness for Families", bodyLarge, grey)
        ├── User Type Toggle (Parent/Child buttons)
        ├── Email TextField
        ├── Password TextField
        ├── Sign In Button
        └── Sign Up Link
```

### Key Components

**User Type Toggle**
- Custom container with grey background (#F0F0F0)
- Two equal-width segments
- Selected segment: deep purple background (#7C4DFF) with white text
- Unselected: transparent with grey text
- Border radius: 12px
- Uses GestureDetector for state changes

**Text Fields**
- Rounded border (radius: 12px)
- Light background (#FAFAFA)
- Prefix icons (email and lock)
- Outline input borders

**Sign In Button**
- Full width, rounded corners (12px)
- Deep purple background (#7C4DFF)
- White text, fontSize: 16, fontWeight: 600
- Padding: 16px vertical
- Uses pushReplacementNamed to navigate based on user type

---

## 5. Parent Dashboard

### Layout Architecture
```
Scaffold
├── AppBar (conditional - only on home tab)
│   ├── Menu icon (leading)
│   ├── "SafeSpace" title
│   └── Notifications icon
├── Body (SingleChildScrollView)
│   └── Column of cards
└── BottomNavigationBar
```

### Home Tab Content (4 Cards)

#### Card 1: Excessive Screen Time
- **Background**: Orange with 30% opacity (#F5A962)
- **Layout**: Row with emoji (⚠️) and text content
- **Content**:
  - Title: "Excessive Screen Time"
  - Subtitle: "2 long sessions today"
  - Details: List of apps with durations
  - Action Button: "VIEW DETAILS" (white background)
- **Navigation**: Opens ScreenTimeDetails

#### Card 2: Daily App Usage
- **Background**: Purple with 50% opacity (#CDB4DB)
- **Layout**: Row with icon box and text
- **Content**:
  - Title: "Daily App Usage"
  - Breakdown by category (Social Media, Games, Educational)
  - Icon box (size: 60×60, blue background, smartphone icon)
  - Action Button: "VIEW BREAKDOWN"
- **Navigation**: Opens AppUsageReport

#### Card 3: Sleep Score
- **Background**: Yellow (#FFF3CD)
- **Layout**: Row with circular progress indicator
- **Content**:
  - Title: "Sleep Score"
  - Circular progress (65%, deep purple stroke)
  - Percentage display (24px, bold, purple)
  - Details: Hours and last phone use time
  - Emoji: 😴 (size: 48)
  - Action Button: "VIEW DETAILS"
- **Navigation**: Opens SleepTracker

#### Card 4: Mood Summary
- **Background**: Green (#D4EDDA)
- **Layout**: Column with mood emoji grid
- **Content**:
  - Title: "Mood Summary"
  - 5 emoji columns (Mon-Fri)
  - Each shows emoji and day label
  - Action Button: "VIEW DETAILS"
- **Navigation**: Opens MoodView

### Reports Tab
- Displays ReportsScreen (full analytics)
- Multiple sections with charts and insights

### Settings Tab
- Displays SettingsScreen
- Parental controls configuration

---

## 6. Child Dashboard

### Layout Architecture
```
Scaffold
├── AppBar
│   └── Custom title with greeting
│       ("Hey Aarav! 👋" + subtitle)
├── Body (SingleChildScrollView)
│   └── Column of cards
├── FloatingActionButton.extended
│   └── "Take a Break" + 🧘 emoji
└── BottomNavigationBar
```

### Home Tab Content (3 Cards)

#### Card 1: Your Screen Time
- **Background**: White
- **Layout**: Column
- **Content**:
  - Icon: smartphone (deep purple)
  - Title: "Your Screen Time"
  - Main metric: "2h 45m today" (fontSize: 28, bold)
  - Goal: "Daily goal: 3h"
  - Linear progress bar (92% filled, green color)
  - Feedback: "You're doing great! 🎯" (green text)
  - Time remaining: "15 minutes left" (grey text)

#### Card 2: Quick Mood Check
- **Background**: Light purple (#F3E5F5)
- **Layout**: Column
- **Content**:
  - Title: "Quick Mood Check"
  - Subtitle: "How are you feeling today?"
  - 5 mood selector buttons (😢, 😟, 😐, 😊, 😄)
  - Selected mood has border and purple background tint
  - Add Note Button with icon

#### Card 3: Today's Habits
- **Background**: White
- **Layout**: Column
- **Content**:
  - Icon: check circle (green)
  - Title: "Today's Habits"
  - Three habit rows with:
    - Checkbox (filled or outline)
    - Habit icon and name
    - Progress bar (color changes based on completion)
    - Current/target metric
  - "SEE ALL →" button (right-aligned, purple)

### Floating Action Button
- Label: "Take a Break"
- Icon: 🧘 (meditation emoji)
- Background: Deep purple (#7C4DFF)
- Opens BreakReminderDialog when tapped

---

## 7. Screen Pages - Detailed Breakdown

### Screen Time Details
**Purpose**: Detailed view of app usage sessions
**Chart**: Bar chart showing daily hours (using fl_chart)
**Content**: List of session cards with:
- App icon/emoji
- App name and duration
- Time range
- Warnings or positive indicators
- Color-coded icons (orange for warnings, green for positive)

### Sleep Tracker
**Purpose**: Track weekly sleep patterns
**Content**:
- Weekly summary card with sleep rows
- Each row shows: Day, hours, status, star rating, progress bar
- Status colors: Green (Great), Light Green (Good), Orange (Below), Red (Poor)
- Score summary card with current score and target

### Mood Journal (Child)
**Purpose**: Private journal for emotion tracking
**Sections**:
- New entry card with mood selector and text field
- Share with parents checkbox
- Past entries list
- Each entry shows: date, mood emoji, mood label, time, note, privacy status
- Edit/Delete buttons for each entry
- FAB for scrolling to top

### Habits Tracker (Child)
**Purpose**: Track daily wellness habits with gamification
**Habits Tracked**:
1. Water Intake (💧) - 8 glasses target
   - Visual water drop indicators
   - Circular progress (75%)
   - Add button to increment

2. Outdoor Time (☀️) - 30 min target
   - Circular progress (50%)
   - Start Timer button
   - Helpful tip

3. Exercise (🏃) - 20 min target
   - Circular progress (0%)
   - Log Activity button
   - Suggestions

**Bottom Sections**:
- Streak indicator: "This Week's Streak: 4 days" with 🔥 emoji
- Encouragement banner: "Keep it up! You're awesome!"

### Break Reminder Dialog
**Purpose**: Encourage healthy breaks
**Trigger**: After 45 minutes of screen time
**Content**:
- Large 🧘 emoji (64px)
- Title: "Time for a Break!"
- Description: "You've been on your phone for 45 minutes."
- 3 Activity buttons:
  - "5-Minute Breathing" (teal background)
  - "Stretch Your Eyes" (blue background)
  - "Walk Around" (green background)
- "Snooze (15 min)" text button
- Motivational message: "Taking breaks helps your brain and body feel better! 💚"

### App Usage Report
**Purpose**: Categorized breakdown of app usage
**Sections**:
- Pie chart (centered, 60px inner radius)
- Center text: "6 h 20 m" (Total time)
- Category cards:
  - Social Media (orange) with Instagram, TikTok, Snapchat
  - Games (blue) with CODM, Subway Surf
  - Educational (green) with Khan Academy, Duolingo
- Each app shows time and progress bar

### Mood View (Parent)
**Purpose**: Comprehensive mood tracking visualization
**Sections**:
1. Mood Calendar (orange background)
   - 5 days with emoji and day labels
   - Tappable to select day
   - Selected emoji enlarges

2. Selected Day Details (purple background)
   - Emoji + mood + date
   - Shared note in orange box
   - Time logged

3. Trend Chart (line chart using fl_chart)
   - X-axis: days
   - Y-axis: mood levels (1-3, with labels)
   - Curved line showing mood progression
   - Blue color

### Reports Screen (Parent)
**Purpose**: Comprehensive analytics dashboard
**Key Sections**:

1. **Period Selector**: Dropdown for time range
   - Options: This Week, Last Week, This Month, Last Month

2. **Weekly Summary**: 4 metric cards
   - Each card shows icon, value, label, and % change
   - Colors match category (orange, purple, green, pink)
   - Green/red background for positive/negative change

3. **Screen Time Trends**: Line chart with insight
   - 7-day data
   - Orange line, filled area below
   - Insight card with checkmark: "Great progress! Screen time decreased by 15% this week."

4. **App Usage Breakdown**: Horizontal progress bars
   - YouTube, TikTok, Instagram, Games, Educational
   - Each with time and color-coded bar

5. **Sleep Quality**: Metrics card
   - Average sleep duration
   - Average bedtime
   - Insight with star icon

6. **Mood Trends**: Emoji statistics
   - 4 mood categories with percentages
   - Insight about correlation with screen time

### Settings Screen (Parent)
**Purpose**: Configuration and account management
**Sections**:

1. **Profile Section**
   - Avatar circle with person icon
   - Name and email
   - Edit button

2. **Screen Time Limits**
   - Slider for daily limit (1-8 hours)
   - Bedtime settings tile
   - Blocked apps tile

3. **Notifications**
   - 4 toggle switches:
     - Push Notifications
     - Daily Reports
     - Screen Time Alerts
     - Bedtime Reminders

4. **Child Accounts**
   - List of managed children
   - Each shows avatar, name, age, active status badge
   - Add Child Account button

5. **App Settings**
   - Appearance (Light/Dark mode)
   - Language
   - Privacy & Security

6. **Support**
   - Help Center
   - Send Feedback
   - About
   - Sign Out button (red text)

---

## 8. Data Flow & Models

### AppUsageData
```dart
{
  appName: String,        // "Instagram"
  iconPath: String,       // "📷"
  minutes: int,           // 45
  timeRange: String,      // "6:30 PM-7:15 PM"
  warnings: List<String>, // ["No breaks taken"]
  isPositive: bool        // false
}
```

### SleepData
```dart
{
  day: String,            // "Monday"
  hours: double,          // 7.5
  status: String,         // "Good", "Great", "Below", "Poor"
  note: String?,          // Optional note
  statusColor: Color,     // Computed color
  starCount: int          // 0, 1, or 2
}
```

### MoodEntry
```dart
{
  date: DateTime,         // 2024-02-04
  mood: String,           // "happy", "excited", "neutral", "sad", "worried"
  note: String?,          // Optional journal entry
  isShared: bool,         // false = private, true = shared with parents
  time: String,           // "8:45 PM"
  moodEmoji: String       // Computed: "😊"
}
```

### HabitData
```dart
{
  name: String,           // "Water Intake"
  icon: String,           // "💧"
  current: int,           // 6
  target: int,            // 8
  unit: String,           // "glasses"
  progress: double        // Computed: 0.75
}
```

---

## 9. Chart Implementations (using fl_chart)

### Bar Chart (Screen Time Weekly)
- X-axis: Days (Mon-Sun)
- Y-axis: Hours (0-8h)
- Bar color: Deep purple
- Highlight bar on current/recent day
- Grid lines for readability

### Pie Chart (App Usage)
- 3 sections: Social Media (45%), Games (30%), Educational (25%)
- Colors: Orange, Blue, Green
- Center space showing total time

### Line Chart (Screen Time Trends & Mood)
- Smooth curves between data points
- Fill area below line with transparency
- Multiple line support for comparisons
- Grid for reference

---

## 10. Responsive Design Considerations

### Mobile (< 600px)
- Full-width single column layout
- Bottom navigation bar for primary navigation
- Touch-friendly tap targets (48px minimum)
- Larger padding between elements

### Tablet (600-1200px)
- 2-column card layout with wrapping
- Increased font sizes
- Side drawer optional for navigation
- Increased touch target sizes

### Desktop (> 1200px)
- 3-column grid layouts
- Sidebar navigation
- Larger fonts and spacing
- Horizontal card arrangements

---

## 11. Key Design Patterns

### Card-Based Layout
All major content sections are presented as Material Design Cards with:
- Consistent elevation (2 shadow points)
- Rounded corners (12-16px)
- Padding (16px)
- Light backgrounds with color overlays

### Color Coding
- Different sections use distinct background colors for quick visual scanning
- Orange = warnings/alerts
- Purple = primary action/headers
- Yellow = sleep/information
- Green = success/positive
- Blue = data visualization

### Progress Indicators
- **Circular Progress**: Used for main metrics (sleep score, habit progress)
  - Diameter: 50-80px
  - Stroke width: 6-8px
  - Center percentage text
- **Linear Progress**: Used for detailed metrics (app time bars, habit progress)
  - Height: 8-12px
  - Rounded ends
  - Color-coded by status

### Gamification Elements (Child)
- Emojis throughout interface for emotional connection
- Streak counters to encourage consistency
- Progress indicators for visual feedback
- Encouragement messages and positive reinforcement
- Achievement-style badges and icons

### Data Visualization
- Bar charts for time-based comparisons
- Line charts for trend analysis
- Pie charts for category breakdowns
- Color matching between legend and visualization

---

## 12. State Management

### UserProvider (Global)
Manages:
- Current user type (parent/child)
- Child name for personalization
- Notifies all listeners when state changes

### Local State
Each screen manages its own local state using StatefulWidget for:
- Form inputs (TextEditingController)
- Selected items (mood, filters, etc.)
- Toggle states (switches, expanded/collapsed)

### Future Enhancements
- Consider adding separate providers for:
  - ScreenTimeProvider (tracks and manages screen time data)
  - MoodProvider (manages mood entries)
  - HabitsProvider (manages habit tracking)
  - ReportsProvider (caches and computes analytics)

---

## 13. Typography Hierarchy

```
Headlines (32px, bold)           - Main screen titles
Titles Large (22px, bold)        - Card titles, section headers
Titles Medium (18px, 600wt)      - Sub-headers
Body Large (16px)                - Primary body text
Body Medium (14px)               - Secondary body text
Body Small (12px)                - Captions, fine print
```

---

## 14. Button Styles

### Primary Button (ElevatedButton)
- Background: Deep Purple (#7C4DFF)
- Text: White
- Padding: 16px vertical, 24px horizontal
- Border radius: 12px
- Font weight: 600

### Secondary Button (TextButton)
- Text color: Deep Purple (#7C4DFF)
- No background
- Used for less prominent actions

### Icon Button
- Icon color: Matching section color or grey
- Size: 24px or 48px (FAB)
- Consistent padding

---

## 15. Animation & Transitions

### Screen Transitions
- Named route navigation with platform-specific animations
- Push/pop animations for navigation stack

### State Changes
- Smooth transitions for mood selection (border animation)
- Progress bar animations when values update
- Snackbar animations for feedback

---

## Implementation Notes for Next.js Conversion

1. **Component Structure**: Map Flutter widgets to React components
2. **State Management**: Use Zustand or Redux instead of Provider
3. **Styling**: Use Tailwind CSS or CSS Modules for theme colors
4. **Charts**: Use Recharts or Chart.js instead of fl_chart
5. **Icons**: Use react-icons or Material-UI icons
6. **Forms**: Use React Hook Form for input management
7. **Navigation**: Use Next.js App Router for routes

---

## File Structure Summary

```
lib/
├── main.dart                 # Entry point, UserProvider
├── theme/
│   └── app_theme.dart       # Theme configuration, colors
├── screens/
│   ├── login_screen.dart
│   ├── parent_dashboard.dart
│   ├── child_dashboard.dart
│   ├── screen_time_details.dart
│   ├── app_usage_report.dart
│   ├── sleep_tracker.dart
│   ├── mood_journal.dart
│   ├── mood_view.dart
│   ├── habits_tracker.dart
│   ├── break_reminder.dart
│   ├── reports_screen.dart
│   └── settings_screen.dart
├── models/
│   └── app_data.dart        # Data models
├── services/                # Data fetching, APIs
└── providers/               # Future state management
```

---

## Summary

SafeSpace is a well-designed, child-friendly digital wellness app with:
- ✅ Clear dual interface (parent/child)
- ✅ Comprehensive screen time tracking
- ✅ Mood and habit monitoring
- ✅ Gamified experience for children
- ✅ Analytics and insights for parents
- ✅ Consistent Material Design 3 aesthetic
- ✅ Responsive layout considerations
- ✅ User-friendly navigation

This design document provides all the specifications needed to faithfully recreate SafeSpace as a Next.js web application.
