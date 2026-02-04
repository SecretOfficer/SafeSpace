import 'package:flutter/material.dart';

class MoodJournal extends StatefulWidget {
  const MoodJournal({super.key});

  @override
  State<MoodJournal> createState() => _MoodJournalState();
}

class _MoodJournalState extends State<MoodJournal> {
  String? _selectedMood;
  final _noteController = TextEditingController();
  final _scrollController = ScrollController();
  bool _shareWithParents = false;

  final List<Map<String, dynamic>> _entries = [
    {
      'date': 'Feb 4',
      'mood': '😊',
      'moodLabel': 'Happy',
      'time': '8:45 PM',
      'note': 'Had fun at football practice today!',
      'isPrivate': true,
    },
    {
      'date': 'Feb 3',
      'mood': '😢',
      'moodLabel': 'Sad',
      'time': '9:15 PM',
      'note': 'Had a fight with my best friend...',
      'isPrivate': false,
    },
    {
      'date': 'Feb 2',
      'mood': '😊',
      'moodLabel': 'Happy',
      'time': '7:30 PM',
      'note': 'Got an A on my math test!',
      'isPrivate': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            const Text('Your Journal'),
            const SizedBox(width: 8),
            const Icon(Icons.lock, size: 18),
          ],
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Private - Only you can see this',
              style: TextStyle(
                color: Colors.grey[600],
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 16),
            _buildNewEntryCard(),
            const SizedBox(height: 24),
            const Text(
              'Past Entries',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            ..._entries.map((entry) => _buildEntryCard(entry)),
            const SizedBox(height: 80),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _scrollController.animateTo(
            0,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildNewEntryCard() {
    final moods = ['😢', '😟', '😐', '😊', '😄'];

    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.grey[300]!),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'How are you feeling right now?',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              children: moods.map((mood) {
                final isSelected = _selectedMood == mood;
                return ChoiceChip(
                  label: Text(mood, style: const TextStyle(fontSize: 24)),
                  selected: isSelected,
                  onSelected: (selected) {
                    setState(() => _selectedMood = selected ? mood : null);
                  },
                  selectedColor: Colors.deepPurple.withOpacity(0.2),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            const Text(
              'Write about your day (optional):',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _noteController,
              maxLines: 4,
              decoration: InputDecoration(
                hintText: "What's on your mind?",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.grey[50],
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Checkbox(
                  value: _shareWithParents,
                  onChanged: (value) {
                    setState(() => _shareWithParents = value ?? false);
                  },
                ),
                const Text('Share this note with parents'),
              ],
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_selectedMood != null) {
                    setState(() {
                      _entries.insert(0, {
                        'date': 'Today',
                        'mood': _selectedMood,
                        'moodLabel': 'Noted',
                        'time': 'Just now',
                        'note': _noteController.text.isEmpty
                            ? 'No note'
                            : _noteController.text,
                        'isPrivate': !_shareWithParents,
                      });
                      _selectedMood = null;
                      _noteController.clear();
                      _shareWithParents = false;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Entry saved!')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text('SAVE ENTRY'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEntryCard(Map<String, dynamic> entry) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      '${entry['date']} - ${entry['mood']} ${entry['moodLabel']}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Text(
                  entry['time'],
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(entry['note']),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      entry['isPrivate'] ? Icons.lock : Icons.visibility,
                      size: 16,
                      color: Colors.grey[600],
                    ),
                    const SizedBox(width: 4),
                    Text(
                      entry['isPrivate'] ? 'Private' : 'Shared with parents',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text('Edit'),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(foregroundColor: Colors.red),
                      child: const Text('Delete'),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
