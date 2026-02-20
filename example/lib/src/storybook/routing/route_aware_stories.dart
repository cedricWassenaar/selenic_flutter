import 'package:example/src/storybook/common/pages/colors_page.dart';
import 'package:example/src/storybook/common/pages/home_page.dart';
import 'package:example/src/storybook/common/pages/typography_page.dart';
import 'package:example/src/storybook/stories/composites/combobox_multi_select.dart';
import 'package:example/src/storybook/stories/composites/combobox_single_select.dart';
import 'package:example/src/storybook/stories/composites/search_with_dropdown.dart';
import 'package:example/src/storybook/stories/composites/search_with_list.dart';
import 'package:example/src/storybook/stories/primitives/accordion.dart';
import 'package:example/src/storybook/stories/primitives/alert.dart';
import 'package:example/src/storybook/stories/primitives/auth_code.dart';
import 'package:example/src/storybook/stories/primitives/avatar.dart';
import 'package:example/src/storybook/stories/primitives/bottom_sheet.dart';
import 'package:example/src/storybook/stories/primitives/breadcrumb.dart';
import 'package:example/src/storybook/stories/primitives/button.dart';
import 'package:example/src/storybook/stories/primitives/carousel.dart';
import 'package:example/src/storybook/stories/primitives/checkbox.dart';
import 'package:example/src/storybook/stories/primitives/chip.dart';
import 'package:example/src/storybook/stories/primitives/circular_loader.dart';
import 'package:example/src/storybook/stories/primitives/circular_progress.dart';
import 'package:example/src/storybook/stories/primitives/dot_indicator.dart';
import 'package:example/src/storybook/stories/primitives/drawer.dart';
import 'package:example/src/storybook/stories/primitives/dropdown.dart';
import 'package:example/src/storybook/stories/primitives/icons.dart';
import 'package:example/src/storybook/stories/primitives/linear_loader.dart';
import 'package:example/src/storybook/stories/primitives/linear_progress.dart';
import 'package:example/src/storybook/stories/primitives/menu_item.dart';
import 'package:example/src/storybook/stories/primitives/modal.dart';
import 'package:example/src/storybook/stories/primitives/popover.dart';
import 'package:example/src/storybook/stories/primitives/radio.dart';
import 'package:example/src/storybook/stories/primitives/segmented_control.dart';
import 'package:example/src/storybook/stories/primitives/switch.dart';
import 'package:example/src/storybook/stories/primitives/tab_bar.dart';
import 'package:example/src/storybook/stories/primitives/table.dart';
import 'package:example/src/storybook/stories/primitives/tag.dart';
import 'package:example/src/storybook/stories/primitives/text_area.dart';
import 'package:example/src/storybook/stories/primitives/text_input.dart';
import 'package:example/src/storybook/stories/primitives/text_input_group.dart';
import 'package:example/src/storybook/stories/primitives/toast.dart';
import 'package:example/src/storybook/stories/primitives/tooltip.dart';

import 'package:flutter/services.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

const String directory = 'assets/code_snippets/';

final List<Story> routeAwareStories = [
  // Pages.
  Story(
    name: 'Home',
    builder: (context) {
      return const HomePage();
    },
  ),
  Story(
    name: 'Colors',
    builder: (context) {
      return const ColorsPage();
    },
  ),
  Story(
    name: 'Typography',
    builder: (context) {
      return const TypographyPage();
    },
  ),

  // Composite stories.
  Story(
    name: 'Composites/Combobox/single select combobox',
    builder: (context) {
      return const ComboboxSingleSelectStory();
    },
  ),
  Story(
    name: 'Composites/Combobox/multi select combobox',
    builder: (context) {
      return const ComboboxMultiSelectStory();
    },
  ),
  Story(
    name: 'Composites/Search/search with list',
    builder: (context) {
      return const SearchWithListStory();
    },
  ),
  Story(
    name: 'Composites/Search/search with dropdown',
    builder: (context) {
      return const SearchWithDropdownStory();
    },
  ),

  // Primitive stories.
  Story(
    name: 'Primitives/Accordion',
    builder: (context) {
      return const AccordionStory();
    },
  ),
  Story(
    name: 'Primitives/Alert',
    builder: (context) {
      return const AlertStory();
    },
  ),
  Story(
    name: 'Primitives/AuthCode',
    builder: (context) {
      return const AuthCodeStory();
    },
  ),
  Story(
    name: 'Primitives/Avatar',
    builder: (context) {
      return const AvatarStory();
    },
  ),
  Story(
    name: 'Primitives/BottomSheet',
    builder: (context) {
      return const BottomSheetStory();
    },
  ),
  Story(
    name: 'Primitives/Breadcrumb',
    builder: (context) {
      return const BreadcrumbStory();
    },
  ),
  Story(
    name: 'Primitives/Button',
    builder: (context) {
      return const ButtonStory();
    },
  ),
  Story(
    name: 'Primitives/Carousel',
    builder: (context) {
      return const CarouselStory();
    },
  ),
  Story(
    name: 'Primitives/Checkbox',
    builder: (context) {
      return const CheckboxStory();
    },
  ),
  Story(
    name: 'Primitives/Chip',
    builder: (context) {
      return const ChipStory();
    },
  ),
  Story(
    name: 'Primitives/Loader/CircularLoader',
    builder: (context) {
      return const CircularLoaderStory();
    },
  ),
  Story(
    name: 'Primitives/Progress/CircularProgress',
    builder: (context) {
      return const CircularProgressStory();
    },
  ),
  Story(
    name: 'Primitives/DotIndicator',
    builder: (context) {
      return const DotIndicatorStory();
    },
  ),
  Story(
    name: 'Primitives/Drawer',
    builder: (context) {
      return const DrawerStory();
    },
  ),
  Story(
    name: 'Primitives/Dropdown',
    builder: (context) {
      return const DropdownStory();
    },
  ),
  Story(
    name: 'Primitives/Icons',
    builder: (context) {
      return const IconsStory();
    },
  ),
  Story(
    name: 'Primitives/Loader/LinearLoader',
    builder: (context) {
      return const LinearLoaderStory();
    },
  ),
  Story(
    name: 'Primitives/Progress/LinearProgress',
    builder: (context) {
      return const LinearProgressStory();
    },
  ),
  Story(
    name: 'Primitives/MenuItem',
    builder: (context) {
      return const MenuItemStory();
    },
  ),
  Story(
    name: 'Primitives/Modal',
    builder: (context) {
      return const ModalStory();
    },
  ),
  Story(
    name: 'Primitives/Popover',
    builder: (context) {
      return const PopoverStory();
    },
  ),
  Story(
    name: 'Primitives/Radio',
    builder: (context) {
      return const RadioStory();
    },
  ),
  Story(
    name: 'Primitives/SegmentedControl',
    builder: (context) {
      return const SegmentedControlStory();
    },
  ),
  Story(
    name: 'Primitives/Switch',
    builder: (context) {
      return const SwitchStory();
    },
  ),
  Story(
    name: 'Primitives/TabBar',
    builder: (context) {
      return const TabBarStory();
    },
  ),
  Story(
    name: 'Primitives/Table',
    builder: (context) {
      return const TableStory();
    },
  ),
  Story(
    name: 'Primitives/Tag',
    builder: (context) {
      return const TagStory();
    },
  ),
  Story(
    name: 'Primitives/TextArea',
    builder: (context) {
      return const TextAreaStory();
    },
  ),
  Story(
    name: 'Primitives/TextInput',
    builder: (context) {
      return const TextInputStory();
    },
  ),
  Story(
    name: 'Primitives/TextInputGroup',
    builder: (context) {
      return const TextInputGroupStory();
    },
  ),
  Story(
    name: 'Primitives/Toast',
    builder: (context) {
      return const ToastStory();
    },
  ),
  Story(
    name: 'Primitives/Tooltip',
    builder: (context) {
      return const TooltipStory();
    },
  ),
];

Future<String> fetchAsset(String assetName) =>
    rootBundle.loadString('$directory$assetName');
