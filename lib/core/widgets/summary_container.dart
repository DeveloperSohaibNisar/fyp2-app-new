import 'package:flutter/material.dart';
import 'package:fyp2_clean_architecture/core/models/summary/summary_data.dart';

class SummaryContainer extends StatelessWidget {
  final SummaryData summaryData;
  const SummaryContainer({super.key, required this.summaryData});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title Heading
            Center(
              child: Text(
                summaryData.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Heading
            const Text(
              'Summary',
              // textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              summaryData.summary,
              textAlign: TextAlign.start,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 16),
            // Heading
            const Text(
              'Additional Info',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            // Sub Heading
            const Text(
              'Main Points',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            for (var item in summaryData.additionalInfo.actionItems)
              Column(
                children: [
                  const SizedBox(height: 8),
                  Text(
                    '\u2022 $item',
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            const SizedBox(height: 16),
            // Sub Heading
            const Text(
              'Potential Action Items',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            for (var item in summaryData.additionalInfo.actionItems)
              Column(
                children: [
                  const SizedBox(height: 8),
                  Text(
                    '\u2022 $item',
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            const SizedBox(height: 16),
            // Sub Heading
            const Text(
              'Follow-Up Questions',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            for (var item in summaryData.additionalInfo.followUpQuestions)
              Column(
                children: [
                  const SizedBox(height: 8),
                  Text(
                    '\u2022 $item',
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
