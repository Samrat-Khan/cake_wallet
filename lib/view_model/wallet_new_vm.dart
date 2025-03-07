import 'package:cake_wallet/ethereum/ethereum.dart';
import 'package:cake_wallet/bitcoin_cash/bitcoin_cash.dart';
import 'package:hive/hive.dart';
import 'package:mobx/mobx.dart';
import 'package:cake_wallet/monero/monero.dart';
import 'package:cake_wallet/nano/nano.dart';
import 'package:cake_wallet/store/app_store.dart';
import 'package:cw_core/wallet_base.dart';
import 'package:cake_wallet/core/wallet_creation_service.dart';
import 'package:cw_core/wallet_credentials.dart';
import 'package:cw_core/wallet_info.dart';
import 'package:cw_core/wallet_type.dart';
import 'package:cake_wallet/view_model/wallet_creation_vm.dart';
import 'package:cake_wallet/bitcoin/bitcoin.dart';
import 'package:cake_wallet/haven/haven.dart';

part 'wallet_new_vm.g.dart';

class WalletNewVM = WalletNewVMBase with _$WalletNewVM;

abstract class WalletNewVMBase extends WalletCreationVM with Store {
  WalletNewVMBase(AppStore appStore, WalletCreationService walletCreationService,
      Box<WalletInfo> walletInfoSource,
      {required WalletType type})
      : selectedMnemonicLanguage = '',
        super(appStore, walletInfoSource, walletCreationService, type: type, isRecovery: false);

  @observable
  String selectedMnemonicLanguage;

  bool get hasLanguageSelector => type == WalletType.monero || type == WalletType.haven;

  @override
  WalletCredentials getCredentials(dynamic _options) {
    final options = _options as List<dynamic>;
    switch (type) {
      case WalletType.monero:
        return monero!.createMoneroNewWalletCredentials(
            name: name, language: options.first as String, isPolyseed: options.last as bool);
      case WalletType.bitcoin:
        return bitcoin!.createBitcoinNewWalletCredentials(name: name);
      case WalletType.litecoin:
        return bitcoin!.createBitcoinNewWalletCredentials(name: name);
      case WalletType.haven:
        return haven!.createHavenNewWalletCredentials(
            name: name, language: options.first as String);
      case WalletType.ethereum:
        return ethereum!.createEthereumNewWalletCredentials(name: name);
      case WalletType.bitcoinCash:
        return bitcoinCash!.createBitcoinCashNewWalletCredentials(name: name);
      case WalletType.nano:
        return nano!.createNanoNewWalletCredentials(name: name);
      default:
        throw Exception('Unexpected type: ${type.toString()}');
    }
  }

  @override
  Future<WalletBase> process(WalletCredentials credentials) async {
    walletCreationService.changeWalletType(type: type);
    return walletCreationService.create(credentials);
  }
}
