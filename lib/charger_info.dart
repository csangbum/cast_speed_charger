
import 'package:test3/utils/utils.dart';

enum ChargingStatus {
  selectCable,
  selectPayment,
  readCard,
  connectCable,
  charging,
  chargingComplete
}

class ChargingController {
  ChargerInfo chargerInfo = ChargerInfo.getInstance();
  late ChargingStatus _currentStatus;


  // 생성자
  ChargingController() {
    _currentStatus = chargerInfo.chargingStatus;
  }

  // 현재 상태 가져오기
  ChargingStatus getCurrentStatus() {
    return _currentStatus;
  }

  void setStatus(ChargingStatus status) {
    _currentStatus = status;
    chargerInfo.chargingStatus = _currentStatus;
  }

  // 이전 상태로 변경하기
  void moveToPreviousState() {
    _currentStatus = chargerInfo.chargingStatus;
    switch (_currentStatus) {
      case ChargingStatus.selectCable:
      // 현재 상태가 selectCable일 때는 이전 상태가 없으므로 변경하지 않음
        break;
      case ChargingStatus.selectPayment:
        _currentStatus = ChargingStatus.selectCable;
        break;
      case ChargingStatus.readCard:
        _currentStatus = ChargingStatus.selectPayment;
        break;
      case ChargingStatus.connectCable:
        _currentStatus = ChargingStatus.readCard;
        break;
      case ChargingStatus.charging:
        _currentStatus = ChargingStatus.connectCable;
        break;
      case ChargingStatus.chargingComplete:
        _currentStatus = ChargingStatus.charging;
        break;
    }
    chargerInfo.chargingStatus = _currentStatus;
  }

  void moveToNextState() {
    print('csangbum moveToNextState');
    switch (_currentStatus) {
      case ChargingStatus.selectCable:
        _currentStatus = ChargingStatus.selectPayment;
        break;
      case ChargingStatus.selectPayment:
        _currentStatus = ChargingStatus.readCard;
        break;
      case ChargingStatus.readCard:
        _currentStatus = ChargingStatus.connectCable;
        break;
      case ChargingStatus.connectCable:
        _currentStatus = ChargingStatus.charging;
        break;
      case ChargingStatus.charging:
        //_currentStatus = ChargingStatus.chargingComplete;
        break;
      case ChargingStatus.chargingComplete:
      // 현재 상태가 chargingComplete일 때는 다음 상태가 없으므로 변경하지 않음
        break;
    }
    chargerInfo.chargingStatus = _currentStatus;
  }
}

class ChargerInfo {
  static final ChargerInfo _instance = ChargerInfo._internal();
  ChargingStatus chargingStatus = ChargingStatus.selectCable;
  int selectedChannel = 0;

  factory ChargerInfo() => _instance;

  ChargerInfo._internal();

  static ChargerInfo getInstance() {
    return _instance;
  }
}
