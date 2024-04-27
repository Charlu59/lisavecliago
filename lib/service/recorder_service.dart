import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:supercharged/supercharged.dart';
import 'package:audioplayers/audioplayers.dart';

class RecorderService {
  static final RecorderService _singleton = RecorderService._internal();
  factory RecorderService() {
    return _singleton;
  }
  RecorderService._internal();

  final AudioRecorder _audioRecorder = AudioRecorder();
  int _recordDuration = 0;
  Timer? _timer;
  StreamSubscription<RecordState>? _recordSub;
  RecordState _recordState = RecordState.stop;
  StreamSubscription<Amplitude>? _amplitudeSub;
  Amplitude? _amplitude;

  Future<void> startRecording() async {
    _recordSub = _audioRecorder.onStateChanged().listen((recordState) {
      print("recordState : $recordState");
    });

    _amplitudeSub = _audioRecorder
        .onAmplitudeChanged(const Duration(milliseconds: 300))
        .listen((amp) {
      print("amp : ${amp.current}");
    });

    await _start();
  }

  Future<void> stopRecording() async {
    // Stop recording
  }

  Future<void> _start() async {
    try {
      if (await _audioRecorder.hasPermission()) {
        print("_audioRecorder has permission");
        const encoder = AudioEncoder.pcm16bits;

        if (!await _isEncoderSupported(encoder)) {
          return;
        }
        print("_isEncoderSupported");

        final devs = await _audioRecorder.listInputDevices();
        print(devs.toString());

        const config = RecordConfig(encoder: encoder, numChannels: 1);

        Directory appDocumentsDirectory =
            await getApplicationDocumentsDirectory();

        // Record to file
        final b = <Uint8List>[];
        final stream = await _audioRecorder.startStream(config);
        stream.listen(
          (data) {
            b.add(data);
            print("data : ${b.length}");
            if (b.length == 20) {
              print("Generate file");

              final chunk =
                  Uint8List.fromList(b.expand((element) => element).toList());

              const fileName = 'audio_chunk.pcm'; // Example file name

              File file = File('${appDocumentsDirectory.path}/$fileName');
              file.writeAsBytes(chunk).then((audioFile) {
                print("File saved : ${audioFile.path}");

                Future.delayed(1.seconds, () async {
                  print("Play file : ${audioFile.path}");
                  // Play file
                  AudioPlayer audioPlayer = AudioPlayer();
                  await audioPlayer.play(BytesSource(chunk));
                });
              });
            }
          },
          onDone: () => print("onDone"),
        );

        // Record to stream
        // await recordStream(_audioRecorder, config);

        _recordDuration = 0;

        // _startTimer();

        Future.delayed(10.seconds, () {
          print("Stop recording");
          _audioRecorder.stop();
        });
      }
    } catch (e) {
      print("error : $e");
    }
  }

  Future<bool> _isEncoderSupported(AudioEncoder encoder) async {
    final isSupported = await _audioRecorder.isEncoderSupported(
      encoder,
    );

    if (!isSupported) {
      print('${encoder.name} is not supported on this platform.');
      print('Supported encoders are:');

      for (final e in AudioEncoder.values) {
        if (await _audioRecorder.isEncoderSupported(e)) {
          print('- ${encoder.name}');
        }
      }
    }

    return isSupported;
  }
}
