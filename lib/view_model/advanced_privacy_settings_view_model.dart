import 'package:cake_wallet/entities/exchange_api_mode.dart';
import 'package:cake_wallet/entities/fiat_api_mode.dart';
import 'package:cake_wallet/entities/seed_phrase_length.dart';
import 'package:cake_wallet/entities/seed_type.dart';
import 'package:cake_wallet/store/settings_store.dart';
import 'package:cw_core/wallet_type.dart';
import 'package:mobx/mobx.dart';

part 'advanced_privacy_settings_view_model.g.dart';

class AdvancedPrivacySettingsViewModel = AdvancedPrivacySettingsViewModelBase
    with _$AdvancedPrivacySettingsViewModel;

abstract class AdvancedPrivacySettingsViewModelBase with Store {
  AdvancedPrivacySettingsViewModelBase(this.type, this._settingsStore) : _addCustomNode = false;

  @computed
  ExchangeApiMode get exchangeStatus => _settingsStore.exchangeStatus;

  @computed
  FiatApiMode get fiatApiMode => _settingsStore.fiatApiMode;

  @computed
  SeedType get seedType => _settingsStore.moneroSeedType;

  @observable
  bool _addCustomNode = false;

  final WalletType type;

  final SettingsStore _settingsStore;

  bool get hasSeedPhraseLengthOption =>
      type == WalletType.bitcoinCash || type == WalletType.ethereum;

  bool get hasSeedTypeOption => type == WalletType.monero;

  @computed
  bool get addCustomNode => _addCustomNode;

  @computed
  SeedPhraseLength get seedPhraseLength => _settingsStore.seedPhraseLength;

  @action
  void setFiatApiMode(FiatApiMode fiatApiMode) => _settingsStore.fiatApiMode = fiatApiMode;

  @action
  void setSeedType(SeedType seedType) => _settingsStore.moneroSeedType = seedType;

  @action
  void setExchangeApiMode(ExchangeApiMode value) => _settingsStore.exchangeStatus = value;

  @action
  void toggleAddCustomNode() => _addCustomNode = !_addCustomNode;

  @action
  void setSeedPhraseLength(SeedPhraseLength length) => _settingsStore.seedPhraseLength = length;
}
