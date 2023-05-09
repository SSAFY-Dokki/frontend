import 'package:dokki/constants/colors.dart';
import 'package:dokki/data/model/diary/diary_model.dart';
import 'package:dokki/ui/common_widgets/paragraph.dart';
import 'package:dokki/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DiaryItem extends StatelessWidget {
  const DiaryItem({
    super.key,
    required this.diaryData,
  });

  final DiaryModel diaryData;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RoutesName.diaryDetail,
            arguments: {"bookId": diaryData.bookId});
      },
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          border: Border.all(color: grayColor100),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Hero(
              tag: diaryData.diaryId,
              child: Image.network(
                diaryData.diaryImagePath,
                width: 168,
                height: 168,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Paragraph(
                        text:
                            DateFormat('yyyy.MM.dd').format(diaryData.created),
                        size: 12,
                        color: grayColor300,
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Paragraph(
                        text: diaryData.bookTitle,
                        weightType: WeightType.semiBold,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
