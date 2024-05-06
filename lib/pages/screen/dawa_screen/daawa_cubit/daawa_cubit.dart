import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:url_launcher/url_launcher.dart';

part 'daawa_state.dart';

class DaawaCubit extends Cubit<DaawaState> {
  DaawaCubit() : super(DaawaInitial());

  void launchYouTubeChannel(String channelId) async {
    final url = Uri.parse('https://www.youtube.com/@$channelId');

    if (await canLaunchUrl(url)) {
      emit(DaawaLoading());
      await launchUrl(url);
      emit(DaawaSuccess());
    } else {
      emit(DaawaFailuer());
      throw 'Could not launch $url';
    }
  }
}
