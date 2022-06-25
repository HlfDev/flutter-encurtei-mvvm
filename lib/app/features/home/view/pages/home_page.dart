import 'package:encurtei_ly/app/features/home/home.dart';
import 'package:encurtei_ly/app/shared/utils/utils.dart';
import 'package:encurtei_ly/app/shared/view/widgets/scaffold_template.dart';
import 'package:encurtei_ly/app/shared/view/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldTemplate(
      title: HomeStrings.home.title,
      body: Column(
        children: const [
          SearchBar(),
          SizedBox(height: cSize24),
          CardListHeader(),
          SizedBox(height: cSize16),
          Expanded(child: CardList()),
        ],
      ),
      bottom: Padding(
        padding: const EdgeInsets.all(cPadding16),
        child: AppRoundedButton.blue(
          text: HomeStrings.home.shortLink,
          onTap: () {
            viewModalBottomSheet(context);
          },
        ),
      ),
    );
  }

  Future<void> viewModalBottomSheet(BuildContext context) {
    return showModalBottomSheet<void>(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return const BottomSheetModal();
      },
    );
  }
}

class BottomSheetModal extends StatelessWidget {
  const BottomSheetModal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        height: 300,
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(height: cSize16),
              Container(
                height: 55,
                padding: const EdgeInsets.all(cPadding16),
                decoration: BoxDecoration(
                  color: const Color(0xFFF7F8F8),
                  borderRadius: BorderRadius.circular(16.0),
                  border: Border.all(
                    width: 1.0,
                    color: const Color(0xFFF3F3F3),
                  ),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      AppAssets.vectors.svgIconDescription,
                      color: AppColors.darkGrey,
                    ),
                    const SizedBox(width: cSize8),
                    const AppText.medium(
                      text: 'Título',
                      fontSize: cFontSize18,
                      color: AppColors.darkGrey,
                    )
                  ],
                ),
              ),
              const SizedBox(height: cSize16),
              Container(
                height: 55,
                padding: const EdgeInsets.all(cPadding16),
                decoration: BoxDecoration(
                  color: const Color(0xFFF7F8F8),
                  borderRadius: BorderRadius.circular(16.0),
                  border: Border.all(
                    width: 1.0,
                    color: const Color(0xFFF3F3F3),
                  ),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      AppAssets.vectors.svgIconLink,
                      color: AppColors.darkGrey,
                    ),
                    const SizedBox(width: cSize8),
                    const AppText.medium(
                      text: 'Link',
                      fontSize: cFontSize18,
                      color: AppColors.darkGrey,
                    )
                  ],
                ),
              ),
              const SizedBox(height: cSize16),
              AppRoundedButton.blue(
                text: 'Encurtar Link',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardListHeader extends StatelessWidget {
  const CardListHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText.bold(
          text: HomeStrings.home.shortLinks,
          fontSize: cFontSize16,
          color: AppColors.darkGrey,
        ),
        AppText.medium(
          text: HomeStrings.home.totalLinks(2),
          fontSize: cFontSize14,
          color: AppColors.grey,
        ),
      ],
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: cPadding16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(
          color: const Color(0xFFF3F3F3),
        ),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            AppAssets.vectors.svgIconSearch,
            color: AppColors.black,
          ),
          const SizedBox(width: cSize8),
          const AppText.medium(
            text: 'Procurar Link',
            fontSize: cFontSize16,
            color: AppColors.darkGrey,
          )
        ],
      ),
    );
  }
}

class CardList extends StatelessWidget {
  const CardList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return  Padding(
            padding: EdgeInsets.only(bottom: index != 9 ? cPadding16 : 120),
            child: const CardListItem(),
          );
        });
  }
}

class CardListItem extends StatelessWidget {
  const CardListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.all(cPadding16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(
          color: const Color(0xFFF3F3F3),
        ),
      ),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            padding: const EdgeInsets.all(cPadding8),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.lightBlue,
                  AppColors.darkBlue,
                ],
              ),
            ),
            child: SvgPicture.asset(
              AppAssets.vectors.svgIconLink,
              color: AppColors.white,
            ),
          ),
          const SizedBox(width: cSize16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              AppText.medium(
                text: 'Como ganhar dinheiro na . . .',
                fontSize: cFontSize12,
                color: AppColors.black,
              ),
              AppText.light(
                text: '247 visitas',
                fontSize: cFontSize12,
                color: AppColors.grey,
              ),
            ],
          ),
          const Spacer(),
          const Icon(Icons.keyboard_arrow_right_rounded),
        ],
      ),
    );
  }
}
