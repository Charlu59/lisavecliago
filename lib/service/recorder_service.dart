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
        const encoder = AudioEncoder.aacLc;

        if (!await _isEncoderSupported(encoder)) {
          return;
        }
        print("_isEncoderSupported");

        final devs = await _audioRecorder.listInputDevices();
        print(devs.toString());

        const config = RecordConfig(encoder: encoder, numChannels: 1);

        Directory appDocumentsDirectory =
            await getApplicationDocumentsDirectory();

        const fileName = 'audio_chunk.m4a'; // Example file name
        File file = File('${appDocumentsDirectory.path}/$fileName');
        _audioRecorder.start(config, path: file.path);

        // Record to stream
        // await recordStream(_audioRecorder, config);

        _recordDuration = 0;

        // _startTimer();

        Future.delayed(5.seconds, () {
          print("Stop recording");
          _audioRecorder.stop();

          AudioPlayer audioPlayer = AudioPlayer();
          audioPlayer.play(DeviceFileSource(file.path));
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
