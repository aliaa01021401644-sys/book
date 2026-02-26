//important

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';

import 'package:video_player/video_player.dart';

class Movie {
  final String id;
  final String title;
  final String description;
  final String thumbnailUrl;
  final String videoUrl;
  final String duration;
  final String year;
  final String genre;
  final double rating;
  final String director;

  Movie({
    required this.id,
    required this.title,
    required this.description,
    required this.thumbnailUrl,
    required this.videoUrl,
    required this.duration,
    required this.year,
    required this.genre,
    required this.rating,
    required this.director,
  });
}

class Editprofile extends StatelessWidget {
  final List<Movie> movies = [
    Movie(
      id: '1',
      title: 'مشاهد أكشن رائعة',
      description: 'مجموعة من أفضل مشاهد الأكشن في السينما العالمية مع مؤثرات بصرية مذهلة وإثارة لا تنتهي.',
      thumbnailUrl: 'https://scube-applications-media54cbabfc-u3d19945rbtv.s3.eu-west-1.amazonaws.com/media/azharengineering2020/ut1/323d56a3-f469-42d5-9d45-b2abaf392d0d_80f447bb-dac0-4a8a-8613-c730f4f47e8b_Molecular_Structure_intro_video.mp4',
      videoUrl: 'https://scube-applications-media54cbabfc-u3d19945rbtv.s3.eu-west-1.amazonaws.com/media/azharengineering2020/ut1/323d56a3-f469-42d5-9d45-b2abaf392d0d_80f447bb-dac0-4a8a-8613-c730f4f47e8b_Molecular_Structure_intro_video.mp4',
      duration: '02:15',
      year: '2023',
      genre: 'أكشن',
      rating: 4.5,
      director: 'جون ويك',
    ),
    Movie(
      id: '2',
      title: 'مقاطع كوميدية مضحكة',
      description: 'أطرف المقاطع الكوميدية من أفلام Hollywood التي ستجعلك تضحك بدون توقف.',
      thumbnailUrl: 'https://images.unsplash.com/photo-1489599809505-7c8e1c8bfc2f?w=300&h=200&fit=crop',
      videoUrl: 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4',
      duration: '03:45',
      year: '2022',
      genre: 'كوميدي',
      rating: 4.2,
      director: 'كيفن هارت',
    ),
    Movie(
      id: '3',
      title: 'مشاهد رومانسية مؤثرة',
      description: 'أجمل المشاهد الرومانسية من أشهر الأفلام مع حوارات لا تنسى وأداء تمثيلي رائع.',
      thumbnailUrl: 'https://images.unsplash.com/photo-1485846234645-a62644f84728?w=300&h=200&fit=crop',
      videoUrl: 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4',
      duration: '04:20',
      year: '2021',
      genre: 'رومانسي',
      rating: 4.7,
      director: 'نيكولاس سباركس',
    ),
    Movie(
      id: '4',
      title: 'مشاهد دراما قوية',
      description: 'مشاهد درامية مؤثرة من أفلام حصلت على جوائز أوسكار لأفضل أداء تمثيلي.',
      thumbnailUrl: 'https://images.unsplash.com/photo-1574269909862-7e1d70bb8078?w=300&h=200&fit=crop',
      videoUrl: 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4',
      duration: '05:10',
      year: '2020',
      genre: 'دراما',
      rating: 4.8,
      director: 'كريستوفر نولان',
    ),
    Movie(
      id: '5',
      title: 'مقاطع رعب ومغامرة',
      description: 'أكثر المقاطع إثارة ورعباً من أفلام الرعب العالمية التي ستجعلك على حافة مقعدك.',
      thumbnailUrl: 'https://images.unsplash.com/photo-1536440136628-849c177e76a1?w=300&h=200&fit=crop',
      videoUrl: 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4',
      duration: '03:30',
      year: '2023',
      genre: 'رعب',
      rating: 4.3,
      director: 'جيمس وان',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('أفلام ومقاطع'),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return MovieListItem(movie: movies[index]);
        },
      ),
    );
  }
}

class MovieListItem extends StatelessWidget {
  final Movie movie;

  const MovieListItem({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      margin: EdgeInsets.all(8.0),
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MovieDetailScreen(movie: movie),
            ),
          );
        },
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Row(
            children: [
              // صورة الفيلم
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.grey[300],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: CachedNetworkImage(
                    imageUrl: movie.thumbnailUrl,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      color: Colors.grey[300],
                      child: Icon(Icons.movie, color: Colors.grey[600]),
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              ),
              SizedBox(width: 12),
              // معلومات الفيلم
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4),
                    Text(
                      movie.genre,
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.star, size: 14, color: Colors.amber),
                        SizedBox(width: 2),
                        Text(
                          '${movie.rating}',
                          style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.access_time, size: 12, color: Colors.grey),
                        SizedBox(width: 2),
                        Text(
                          movie.duration,
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.calendar_today, size: 12, color: Colors.grey),
                        SizedBox(width: 2),
                        Text(
                          movie.year,
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              //Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}

class MovieDetailScreen extends StatefulWidget {
  final Movie movie;

  const MovieDetailScreen({Key? key, required this.movie}) : super(key: key);

  @override
  _MovieDetailScreenState createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;
  bool _isVideoInitialized = false;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayer();
  }

  void _initializeVideoPlayer() async {
    try {
      _videoPlayerController = VideoPlayerController.network(widget.movie.videoUrl);

      await _videoPlayerController.initialize();

      _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController,
        autoPlay: true,
        looping: false,
        allowFullScreen: true,
        allowMuting: true,
        showControls: true,
        aspectRatio: _videoPlayerController.value.aspectRatio,
        placeholder: Container(
          color: Colors.grey[300],
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 10),
                Text('جاري تحميل الفيديو...'),
              ],
            ),
          ),
        ),
      );

      setState(() {
        _isVideoInitialized = true;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  Widget _buildStarRating(double rating) {
    return Row(
      children: List.generate(5, (index) {
        return Icon(
          index < rating.floor() ? Icons.star : Icons.star_border,
          color: Colors.amber,
          size: 20,
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.movie.title),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              // مشاركة الفيديو
            },
          ),
        ],
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // مشغل الفيديو
            Container(
              height: 250,
              child: _isVideoInitialized && _chewieController != null
                  ? Chewie(controller: _chewieController!)
                  : Container(
                color: Colors.grey[300],
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(height: 10),
                      Text('جاري تحميل الفيديو...'),
                    ],
                  ),
                ),
              ),
            ),

            // تفاصيل الفيلم
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.movie.title,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),

                  // التقييم والنوع
                  Row(
                    children: [
                      _buildStarRating(widget.movie.rating),
                      SizedBox(width: 8),
                      Text(
                        '${widget.movie.rating}',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),

                  // معلومات الفيلم
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      Chip(
                        label: Text(widget.movie.genre),
                        backgroundColor: Colors.deepPurple[50],
                      ),
                      Chip(
                        label: Text('مدة: ${widget.movie.duration}'),
                        backgroundColor: Colors.blue[50],
                      ),
                      Chip(
                        label: Text('سنة: ${widget.movie.year}'),
                        backgroundColor: Colors.green[50],
                      ),
                    ],
                  ),
                  SizedBox(height: 12),

                  // المخرج
                  RichText(
                    text: TextSpan(
                      style: TextStyle(color: Colors.black, fontSize: 14),
                      children: [
                        TextSpan(
                          text: 'المخرج: ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(text: widget.movie.director),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),

                  // وصف الفيلم
                  Text(
                    'الوصف:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    widget.movie.description,
                    style: TextStyle(fontSize: 16, height: 1.5),
                  ),
                  SizedBox(height: 20),

                  // أزرار التحكم
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          if (_chewieController != null) {
                            if (_chewieController!.isPlaying) {
                              _chewieController!.pause();
                            } else {
                              _chewieController!.play();
                            }
                          }
                        },
                        icon: Icon(_chewieController?.isPlaying == true
                            ? Icons.pause : Icons.play_arrow),
                        label: Text(_chewieController?.isPlaying == true
                            ? 'إيقاف' : 'تشغيل'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          foregroundColor: Colors.white,
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          _chewieController?.enterFullScreen();
                        },
                        icon: Icon(Icons.fullscreen),
                        label: Text('شاشة كاملة'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                        ),
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