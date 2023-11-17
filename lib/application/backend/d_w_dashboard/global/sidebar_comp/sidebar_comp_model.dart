import '/application/components/global/app_rectangle_logo/app_rectangle_logo_widget.dart';
import '/application/components/layouts/photo_grid_with_details/photo_grid_with_details_widget.dart';
import '/application/components/menus/menu_item/menu_item_widget.dart';
import '/application/components/menus/sidebar_menu_item/sidebar_menu_item_widget.dart';
import '/application/components/shimmers/shimmer_two_line/shimmer_two_line_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'sidebar_comp_widget.dart' show SidebarCompWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SidebarCompModel extends FlutterFlowModel<SidebarCompWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for AppRectangleLogo component.
  late AppRectangleLogoModel appRectangleLogoModel;
  // Model for PhotoGridWithDetails component.
  late PhotoGridWithDetailsModel photoGridWithDetailsModel1;
  // Model for SidebarMenuItem-BasicInfo.
  late SidebarMenuItemModel sidebarMenuItemBasicInfoModel;
  // Model for SidebarMenuItem-Address.
  late SidebarMenuItemModel sidebarMenuItemAddressModel1;
  // Model for SidebarMenuItem-KYC.
  late SidebarMenuItemModel sidebarMenuItemKYCModel;
  // Model for SidebarMenuItem-Security.
  late SidebarMenuItemModel sidebarMenuItemSecurityModel;
  // Model for SidebarMenuItem-UserReferral.
  late SidebarMenuItemModel sidebarMenuItemUserReferralModel;
  // Model for SidebarMenuItem-Notifications.
  late SidebarMenuItemModel sidebarMenuItemNotificationsModel;
  // Model for SidebarMenuItem-Language.
  late SidebarMenuItemModel sidebarMenuItemLanguageModel;
  // Model for SidebarMenuItem-Appearance.
  late SidebarMenuItemModel sidebarMenuItemAppearanceModel;
  // Model for SidebarMenuItem-Message.
  late SidebarMenuItemModel sidebarMenuItemMessageModel;
  // Model for SidebarMenuItem-HelpSupport.
  late SidebarMenuItemModel sidebarMenuItemHelpSupportModel;
  // Model for SidebarMenuItem-DeleteAccount.
  late SidebarMenuItemModel sidebarMenuItemDeleteAccountModel;
  // Model for SidebarMenuItem-SignOut.
  late SidebarMenuItemModel sidebarMenuItemSignOutModel;
  // Model for SidebarMenuItem-Password.
  late SidebarMenuItemModel sidebarMenuItemPasswordModel;
  // Model for SidebarMenuItem-Pin.
  late SidebarMenuItemModel sidebarMenuItemPinModel;
  // Model for SidebarMenuItem-Biometric.
  late SidebarMenuItemModel sidebarMenuItemBiometricModel;
  // Model for SidebarMenuItem-AppInfo.
  late SidebarMenuItemModel sidebarMenuItemAppInfoModel1;
  // Model for SidebarMenuItem-AppLogo.
  late SidebarMenuItemModel sidebarMenuItemAppLogoModel;
  // Model for SidebarMenuItem-AppEmails.
  late SidebarMenuItemModel sidebarMenuItemAppEmailsModel;
  // Model for SidebarMenuItem-EmailTemplates.
  late SidebarMenuItemModel sidebarMenuItemEmailTemplatesModel;
  // Model for SidebarMenuItem-APIIntegration.
  late SidebarMenuItemModel sidebarMenuItemAPIIntegrationModel;
  // Model for SidebarMenuItem-ConnectAppWeb.
  late SidebarMenuItemModel sidebarMenuItemConnectAppWebModel;
  // Model for SidebarMenuItem-Currency.
  late SidebarMenuItemModel sidebarMenuItemCurrencyModel;
  // Model for SidebarMenuItem-Announcement.
  late SidebarMenuItemModel sidebarMenuItemAnnouncementModel;
  // Model for SidebarMenuItem-RoleAndPermissions.
  late SidebarMenuItemModel sidebarMenuItemRoleAndPermissionsModel;
  // Model for SidebarMenuItem-ManageRecipients.
  late SidebarMenuItemModel sidebarMenuItemManageRecipientsModel1;
  // Model for SidebarMenuItem-ManageRecipients.
  late SidebarMenuItemModel sidebarMenuItemManageRecipientsModel2;
  // Model for SidebarMenuItem-Dashboard.
  late SidebarMenuItemModel sidebarMenuItemDashboardModel;
  // Model for SidebarMenuItem-Bill.
  late SidebarMenuItemModel sidebarMenuItemBillModel;
  // Model for SidebarMenuItem-BillOrders.
  late SidebarMenuItemModel sidebarMenuItemBillOrdersModel;
  // Model for SidebarMenuItem-Transactions.
  late SidebarMenuItemModel sidebarMenuItemTransactionsModel;
  // Model for SidebarMenuItem-VirtualCard.
  late SidebarMenuItemModel sidebarMenuItemVirtualCardModel;
  // Model for SidebarMenuItem-Orders.
  late SidebarMenuItemModel sidebarMenuItemOrdersModel;
  // Model for SidebarMenuItem-Carts.
  late SidebarMenuItemModel sidebarMenuItemCartsModel;
  // Model for SidebarMenuItem-Address.
  late SidebarMenuItemModel sidebarMenuItemAddressModel2;
  // Model for SidebarMenuItem-GiftcardsOrders.
  late SidebarMenuItemModel sidebarMenuItemGiftcardsOrdersModel;
  // Model for SidebarMenuItem-CryptosOrders.
  late SidebarMenuItemModel sidebarMenuItemCryptosOrdersModel;
  // Model for SidebarMenuItem-Recipients.
  late SidebarMenuItemModel sidebarMenuItemRecipientsModel;
  // Model for SidebarMenuItem-Profiles.
  late SidebarMenuItemModel sidebarMenuItemProfilesModel;
  // Model for SidebarMenuItem-Settings.
  late SidebarMenuItemModel sidebarMenuItemSettingsModel;
  // Model for SidebarMenuItem-BillPayments.
  late SidebarMenuItemModel sidebarMenuItemBillPaymentsModel;
  // Model for MenuItem-Orders.
  late MenuItemModel menuItemOrdersModel1;
  // Model for MenuItem-BillPaymentsSettings.
  late MenuItemModel menuItemBillPaymentsSettingsModel;
  // Model for SidebarMenuItem-Fintech.
  late SidebarMenuItemModel sidebarMenuItemFintechModel;
  // Model for MenuItem-Transactions.
  late MenuItemModel menuItemTransactionsModel;
  // Model for MenuItem-Cards.
  late MenuItemModel menuItemCardsModel;
  // Model for MenuItem-FintechSettings.
  late MenuItemModel menuItemFintechSettingsModel;
  // Model for SidebarMenuItem-Ecommerce.
  late SidebarMenuItemModel sidebarMenuItemEcommerceModel;
  // Model for MenuItem-Inventory.
  late MenuItemModel menuItemInventoryModel1;
  // Model for MenuItem-Orders.
  late MenuItemModel menuItemOrdersModel2;
  // Model for MenuItem-Payments.
  late MenuItemModel menuItemPaymentsModel;
  // Model for MenuItem-Settings.
  late MenuItemModel menuItemSettingsModel1;
  // Model for SidebarMenuItem-Giftcards.
  late SidebarMenuItemModel sidebarMenuItemGiftcardsModel;
  // Model for MenuItem-Inventory.
  late MenuItemModel menuItemInventoryModel2;
  // Model for MenuItem-Orders.
  late MenuItemModel menuItemOrdersModel3;
  // Model for MenuItem-Settings.
  late MenuItemModel menuItemSettingsModel2;
  // Model for SidebarMenuItem-Cryptos.
  late SidebarMenuItemModel sidebarMenuItemCryptosModel;
  // Model for MenuItem-Orders.
  late MenuItemModel menuItemOrdersModel4;
  // Model for MenuItem-WalletRates.
  late MenuItemModel menuItemWalletRatesModel;
  // Model for MenuItem-Settings.
  late MenuItemModel menuItemSettingsModel3;
  // Model for SidebarMenuItem-AppInfo.
  late SidebarMenuItemModel sidebarMenuItemAppInfoModel2;
  // Model for SidebarMenuItem-Plugins.
  late SidebarMenuItemModel sidebarMenuItemPluginsModel;
  // Model for SidebarMenuItem-Themes.
  late SidebarMenuItemModel sidebarMenuItemThemesModel;
  // Model for SidebarMenuItem-Users.
  late SidebarMenuItemModel sidebarMenuItemUsersModel;
  // Model for SidebarMenuItem-Media.
  late SidebarMenuItemModel sidebarMenuItemMediaModel;
  // Model for SidebarMenuItem-Posts.
  late SidebarMenuItemModel sidebarMenuItemPostsModel;
  // Model for SidebarMenuItem-Signout.
  late SidebarMenuItemModel sidebarMenuItemSignoutModel1;
  // Model for PhotoGridWithDetails component.
  late PhotoGridWithDetailsModel photoGridWithDetailsModel2;
  // Model for SidebarMenuItem-Signout.
  late SidebarMenuItemModel sidebarMenuItemSignoutModel2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    appRectangleLogoModel = createModel(context, () => AppRectangleLogoModel());
    photoGridWithDetailsModel1 =
        createModel(context, () => PhotoGridWithDetailsModel());
    sidebarMenuItemBasicInfoModel =
        createModel(context, () => SidebarMenuItemModel());
    sidebarMenuItemAddressModel1 =
        createModel(context, () => SidebarMenuItemModel());
    sidebarMenuItemKYCModel =
        createModel(context, () => SidebarMenuItemModel());
    sidebarMenuItemSecurityModel =
        createModel(context, () => SidebarMenuItemModel());
    sidebarMenuItemUserReferralModel =
        createModel(context, () => SidebarMenuItemModel());
    sidebarMenuItemNotificationsModel =
        createModel(context, () => SidebarMenuItemModel());
    sidebarMenuItemLanguageModel =
        createModel(context, () => SidebarMenuItemModel());
    sidebarMenuItemAppearanceModel =
        createModel(context, () => SidebarMenuItemModel());
    sidebarMenuItemMessageModel =
        createModel(context, () => SidebarMenuItemModel());
    sidebarMenuItemHelpSupportModel =
        createModel(context, () => SidebarMenuItemModel());
    sidebarMenuItemDeleteAccountModel =
        createModel(context, () => SidebarMenuItemModel());
    sidebarMenuItemSignOutModel =
        createModel(context, () => SidebarMenuItemModel());
    sidebarMenuItemPasswordModel =
        createModel(context, () => SidebarMenuItemModel());
    sidebarMenuItemPinModel =
        createModel(context, () => SidebarMenuItemModel());
    sidebarMenuItemBiometricModel =
        createModel(context, () => SidebarMenuItemModel());
    sidebarMenuItemAppInfoModel1 =
        createModel(context, () => SidebarMenuItemModel());
    sidebarMenuItemAppLogoModel =
        createModel(context, () => SidebarMenuItemModel());
    sidebarMenuItemAppEmailsModel =
        createModel(context, () => SidebarMenuItemModel());
    sidebarMenuItemEmailTemplatesModel =
        createModel(context, () => SidebarMenuItemModel());
    sidebarMenuItemAPIIntegrationModel =
        createModel(context, () => SidebarMenuItemModel());
    sidebarMenuItemConnectAppWebModel =
        createModel(context, () => SidebarMenuItemModel());
    sidebarMenuItemCurrencyModel =
        createModel(context, () => SidebarMenuItemModel());
    sidebarMenuItemAnnouncementModel =
        createModel(context, () => SidebarMenuItemModel());
    sidebarMenuItemRoleAndPermissionsModel =
        createModel(context, () => SidebarMenuItemModel());
    sidebarMenuItemManageRecipientsModel1 =
        createModel(context, () => SidebarMenuItemModel());
    sidebarMenuItemManageRecipientsModel2 =
        createModel(context, () => SidebarMenuItemModel());
    sidebarMenuItemDashboardModel =
        createModel(context, () => SidebarMenuItemModel());
    sidebarMenuItemBillModel =
        createModel(context, () => SidebarMenuItemModel());
    sidebarMenuItemBillOrdersModel =
        createModel(context, () => SidebarMenuItemModel());
    sidebarMenuItemTransactionsModel =
        createModel(context, () => SidebarMenuItemModel());
    sidebarMenuItemVirtualCardModel =
        createModel(context, () => SidebarMenuItemModel());
    sidebarMenuItemOrdersModel =
        createModel(context, () => SidebarMenuItemModel());
    sidebarMenuItemCartsModel =
        createModel(context, () => SidebarMenuItemModel());
    sidebarMenuItemAddressModel2 =
        createModel(context, () => SidebarMenuItemModel());
    sidebarMenuItemGiftcardsOrdersModel =
        createModel(context, () => SidebarMenuItemModel());
    sidebarMenuItemCryptosOrdersModel =
        createModel(context, () => SidebarMenuItemModel());
    sidebarMenuItemRecipientsModel =
        createModel(context, () => SidebarMenuItemModel());
    sidebarMenuItemProfilesModel =
        createModel(context, () => SidebarMenuItemModel());
    sidebarMenuItemSettingsModel =
        createModel(context, () => SidebarMenuItemModel());
    sidebarMenuItemBillPaymentsModel =
        createModel(context, () => SidebarMenuItemModel());
    menuItemOrdersModel1 = createModel(context, () => MenuItemModel());
    menuItemBillPaymentsSettingsModel =
        createModel(context, () => MenuItemModel());
    sidebarMenuItemFintechModel =
        createModel(context, () => SidebarMenuItemModel());
    menuItemTransactionsModel = createModel(context, () => MenuItemModel());
    menuItemCardsModel = createModel(context, () => MenuItemModel());
    menuItemFintechSettingsModel = createModel(context, () => MenuItemModel());
    sidebarMenuItemEcommerceModel =
        createModel(context, () => SidebarMenuItemModel());
    menuItemInventoryModel1 = createModel(context, () => MenuItemModel());
    menuItemOrdersModel2 = createModel(context, () => MenuItemModel());
    menuItemPaymentsModel = createModel(context, () => MenuItemModel());
    menuItemSettingsModel1 = createModel(context, () => MenuItemModel());
    sidebarMenuItemGiftcardsModel =
        createModel(context, () => SidebarMenuItemModel());
    menuItemInventoryModel2 = createModel(context, () => MenuItemModel());
    menuItemOrdersModel3 = createModel(context, () => MenuItemModel());
    menuItemSettingsModel2 = createModel(context, () => MenuItemModel());
    sidebarMenuItemCryptosModel =
        createModel(context, () => SidebarMenuItemModel());
    menuItemOrdersModel4 = createModel(context, () => MenuItemModel());
    menuItemWalletRatesModel = createModel(context, () => MenuItemModel());
    menuItemSettingsModel3 = createModel(context, () => MenuItemModel());
    sidebarMenuItemAppInfoModel2 =
        createModel(context, () => SidebarMenuItemModel());
    sidebarMenuItemPluginsModel =
        createModel(context, () => SidebarMenuItemModel());
    sidebarMenuItemThemesModel =
        createModel(context, () => SidebarMenuItemModel());
    sidebarMenuItemUsersModel =
        createModel(context, () => SidebarMenuItemModel());
    sidebarMenuItemMediaModel =
        createModel(context, () => SidebarMenuItemModel());
    sidebarMenuItemPostsModel =
        createModel(context, () => SidebarMenuItemModel());
    sidebarMenuItemSignoutModel1 =
        createModel(context, () => SidebarMenuItemModel());
    photoGridWithDetailsModel2 =
        createModel(context, () => PhotoGridWithDetailsModel());
    sidebarMenuItemSignoutModel2 =
        createModel(context, () => SidebarMenuItemModel());
  }

  void dispose() {
    appRectangleLogoModel.dispose();
    photoGridWithDetailsModel1.dispose();
    sidebarMenuItemBasicInfoModel.dispose();
    sidebarMenuItemAddressModel1.dispose();
    sidebarMenuItemKYCModel.dispose();
    sidebarMenuItemSecurityModel.dispose();
    sidebarMenuItemUserReferralModel.dispose();
    sidebarMenuItemNotificationsModel.dispose();
    sidebarMenuItemLanguageModel.dispose();
    sidebarMenuItemAppearanceModel.dispose();
    sidebarMenuItemMessageModel.dispose();
    sidebarMenuItemHelpSupportModel.dispose();
    sidebarMenuItemDeleteAccountModel.dispose();
    sidebarMenuItemSignOutModel.dispose();
    sidebarMenuItemPasswordModel.dispose();
    sidebarMenuItemPinModel.dispose();
    sidebarMenuItemBiometricModel.dispose();
    sidebarMenuItemAppInfoModel1.dispose();
    sidebarMenuItemAppLogoModel.dispose();
    sidebarMenuItemAppEmailsModel.dispose();
    sidebarMenuItemEmailTemplatesModel.dispose();
    sidebarMenuItemAPIIntegrationModel.dispose();
    sidebarMenuItemConnectAppWebModel.dispose();
    sidebarMenuItemCurrencyModel.dispose();
    sidebarMenuItemAnnouncementModel.dispose();
    sidebarMenuItemRoleAndPermissionsModel.dispose();
    sidebarMenuItemManageRecipientsModel1.dispose();
    sidebarMenuItemManageRecipientsModel2.dispose();
    sidebarMenuItemDashboardModel.dispose();
    sidebarMenuItemBillModel.dispose();
    sidebarMenuItemBillOrdersModel.dispose();
    sidebarMenuItemTransactionsModel.dispose();
    sidebarMenuItemVirtualCardModel.dispose();
    sidebarMenuItemOrdersModel.dispose();
    sidebarMenuItemCartsModel.dispose();
    sidebarMenuItemAddressModel2.dispose();
    sidebarMenuItemGiftcardsOrdersModel.dispose();
    sidebarMenuItemCryptosOrdersModel.dispose();
    sidebarMenuItemRecipientsModel.dispose();
    sidebarMenuItemProfilesModel.dispose();
    sidebarMenuItemSettingsModel.dispose();
    sidebarMenuItemBillPaymentsModel.dispose();
    menuItemOrdersModel1.dispose();
    menuItemBillPaymentsSettingsModel.dispose();
    sidebarMenuItemFintechModel.dispose();
    menuItemTransactionsModel.dispose();
    menuItemCardsModel.dispose();
    menuItemFintechSettingsModel.dispose();
    sidebarMenuItemEcommerceModel.dispose();
    menuItemInventoryModel1.dispose();
    menuItemOrdersModel2.dispose();
    menuItemPaymentsModel.dispose();
    menuItemSettingsModel1.dispose();
    sidebarMenuItemGiftcardsModel.dispose();
    menuItemInventoryModel2.dispose();
    menuItemOrdersModel3.dispose();
    menuItemSettingsModel2.dispose();
    sidebarMenuItemCryptosModel.dispose();
    menuItemOrdersModel4.dispose();
    menuItemWalletRatesModel.dispose();
    menuItemSettingsModel3.dispose();
    sidebarMenuItemAppInfoModel2.dispose();
    sidebarMenuItemPluginsModel.dispose();
    sidebarMenuItemThemesModel.dispose();
    sidebarMenuItemUsersModel.dispose();
    sidebarMenuItemMediaModel.dispose();
    sidebarMenuItemPostsModel.dispose();
    sidebarMenuItemSignoutModel1.dispose();
    photoGridWithDetailsModel2.dispose();
    sidebarMenuItemSignoutModel2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
