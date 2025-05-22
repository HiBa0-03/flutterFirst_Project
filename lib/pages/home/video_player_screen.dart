import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String url;
  const VideoPlayerScreen({super.key, required this.url});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late YoutubePlayerController _controller;
  bool _isPlayerReady = false;
  bool _hasError = false;
  String? _videoId;

  @override
  void initState() {
    super.initState();
    _videoId = YoutubePlayer.convertUrlToId(widget.url);
    if (_videoId == null || _videoId!.isEmpty) {
      _hasError = true;
      return;
    }
    _initializePlayer();
  }

  Future<void> _initializePlayer() async {
    try {
      _controller = YoutubePlayerController(
        initialVideoId: _videoId!,
        flags: const YoutubePlayerFlags(
          autoPlay: true,
          mute: false,
          enableCaption: false, 
          disableDragSeek: false, 
          forceHD: true, 
          hideControls: false, 
          controlsVisibleAtStart: true,
        ),
      )..addListener(_playerListener);

      // Charger la vidéo
      _controller.load(_videoId!);

      if (mounted) {
        setState(() {
          _isPlayerReady = true;
        });
      }
    } catch (e) {
      print('Erreur d\'initialisation: $e');
      if (mounted) {
        setState(() {
          _hasError = true;
        });
      }
    }
  }

  void _playerListener() {
    if (_controller.value.hasError) {
      print('Erreur du player: ${_controller.value.errorCode}');
      if (mounted) {
        setState(() {
          _hasError = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        foregroundColor: Colors.white,
      ),
      body: _hasError
          ? _buildErrorWidget()
          : !_isPlayerReady
              ? _buildLoadingWidget()
              : _buildVideoPlayer(),
    );
  }

  Widget _buildLoadingWidget() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(color: Colors.pink),
          SizedBox(height: 16),
          Text(
            'Chargement de la vidéo...',
            style: TextStyle(color: Colors.pink),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, color: Colors.red, size: 50),
          const SizedBox(height: 16),
          const Text(
            'Impossible de charger la vidéo',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.pinkAccent,
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              setState(() {
                _hasError = false;
                _isPlayerReady = false;
              });
              _initializePlayer();
            },
            child: const Text('Réessayer'),
          ),
        ],
      ),
    );
  }

  Widget _buildVideoPlayer() {
    return Container(
      color: Colors.black,
      child: Center(
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            progressIndicatorColor: Colors.pink,
            progressColors: const ProgressBarColors(
              playedColor: Colors.pink,
              handleColor: Colors.pinkAccent,
              bufferedColor: Colors.grey,
            ),
            onReady: () {
              print('Player prêt');
              if (!_controller.value.isPlaying) {
                _controller.play();
              }
            },
            onEnded: (data) {
              print('Vidéo terminée');
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.removeListener(_playerListener);
    _controller.dispose();
    super.dispose();
  }
}