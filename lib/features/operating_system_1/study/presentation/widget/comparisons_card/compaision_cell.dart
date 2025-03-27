import 'package:flutter/material.dart';

class ComparisonsCell extends StatelessWidget {
  final String title;
  final double width;
  final TextStyle style;

  const ComparisonsCell({
    super.key,
    required this.title,
    required this.width,
    required this.style
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: width,
        child: _buildContent(context), // Pass context to the content builder
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    // Check if the title is an image path
    final isImage = title.toLowerCase().startsWith('assets/') ||
        title.toLowerCase().endsWith('.png') ||
        title.toLowerCase().endsWith('.jpg') ||
        title.toLowerCase().endsWith('.jpeg');

    if (isImage) {
      return GestureDetector(
        onTap: () => _showFullScreenImage(context, title),
        child: _buildImageWidget(),
      );
    }

    // Default to text display
    return Text(
      title,
      softWrap: true,
      style: style,
    );
  }

  Widget _buildImageWidget() {
    try {
      return Image.asset(
        title,
        width: width * 0.9,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) =>
            Text('Image Error', style: style),
      );
    } catch (e) {
      return Text('Invalid Image', style: style);
    }
  }

  void _showFullScreenImage(BuildContext context, String imagePath) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        insetPadding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Stack(
            children: [
              InteractiveViewer(
                panEnabled: true,
                minScale: 0.6,
                maxScale: 5.0,
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width,
                    maxHeight: MediaQuery.of(context).size.height,
                  ),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Positioned(
                top: 10,
                right: 30,
                child: IconButton(
                  icon: const Icon(Icons.close, color: Colors.white, size: 30),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }}