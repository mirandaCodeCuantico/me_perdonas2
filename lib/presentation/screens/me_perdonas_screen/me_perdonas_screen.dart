import '../../../barril.dart';

class MePerdonasScreen extends StatefulWidget {
  const MePerdonasScreen({super.key});

  @override
  State<MePerdonasScreen> createState() => _MePerdonasScreenState();
}

class _MePerdonasScreenState extends State<MePerdonasScreen> {

  final AudioPlayer _audioP = AudioPlayer();
  bool isPlaying = false; 

  double incrementWidthSi = 150;
  double incrementHeightSi = 80;

  double decrementWidthNo = 150;
  double decrementHeightNo = 80;

    @override
  void initState() {
    super.initState();
    _audioP.onPlayerComplete.listen((event) {
      setState(() {
        isPlaying = false;
      });
    });
  }

  @override
  void dispose(){
    _audioP.dispose();
    super.dispose();
  }

  Future <void>   _onPressedPlayPause() async {
    if(isPlaying){
      await _audioP.pause();
    } else {
      await _audioP.play(AssetSource('audio/me_perdonas.mp3'));
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  void reinicio() {
    incrementWidthSi = 150;
    incrementHeightSi = 80;
    decrementWidthNo = 150;
    decrementHeightNo = 80;
  }

  void showConfirmacionDePerdon(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text("Ya has perdonado"),
        content: const Text("Ahora estoy perdonado legalemte"),
        actions: [
          TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("JEJEJE"))
        ],
      ),
    );
  }

  void incrementSized(){
    setState(() {
      incrementWidthSi = (incrementWidthSi + 25).clamp(0, double.maxFinite);
      incrementHeightSi = (incrementHeightSi + 10).clamp(0, double.maxFinite);
      decrementWidthNo = (decrementWidthNo - 10).clamp(0, double.maxFinite);
      decrementHeightNo = (decrementHeightNo - 15).clamp(0, double.maxFinite);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Disculpas Sinceras"),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  reinicio();
                });
              },
              icon: const Icon(Icons.refresh_outlined))
        ],
      ),
      body: Center(
        child: Column(
          children: [

            const SizedBox(height: 50),

            Image.asset("assets/images/gatoPerdonador1.png"),

            const SizedBox(height: 20),

            const Text("ME PERDONAS?",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic
                  )
                ),

            const SizedBox(height: 70),

            Wrap(
              children: [
                TomaTuDesicion(
                  color: Colors.red,
                  text: "¡NO!",
                  width: decrementWidthNo,
                  height: decrementHeightNo,
                  onPressed: () {
                    setState(() {
                      incrementSized();
                    });
                  },
                ),

                const SizedBox(width: 20),

                TomaTuDesicion(
                  color: Colors.green,
                  text: "SIII",
                  width: incrementWidthSi,
                  height: incrementHeightSi,
                  onPressed: () {
                    showConfirmacionDePerdon(context);
                    setState(() {
                      reinicio();
                    });
                  },
                ),
              ],
            ),

            const SizedBox(height: 90),

                PlayAndPause(
                  icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow_rounded),
                  onPressed: () {
                    _onPressedPlayPause();
                  },
                )
          ],
        ),
      ),
    );
  }
}
