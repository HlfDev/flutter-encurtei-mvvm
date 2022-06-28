import 'package:encurtei_ly/app/features/home/home.dart';
import 'package:encurtei_ly/app/features/home/view_model/home_view_model.dart';
import 'package:encurtei_ly/app/shared/utils/utils.dart';
import 'package:encurtei_ly/app/shared/view/widgets/scaffold_template.dart';
import 'package:encurtei_ly/app/shared/view/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeViewModel _controller;

  @override
  void initState() {
    super.initState();

    _controller = Provider.of<HomeViewModel>(context, listen: false);
  }

  List<bool> isSeleted = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Short>>(
      future: _controller.getShortList(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Material(child: Center(child: Text("Something went wrong")));
        }

        if (snapshot.data == null) {
          return const Material(child: Center(child: Text("Data don`t exists")));
        }

        if (snapshot.connectionState == ConnectionState.done) {
          final user = FirebaseAuth.instance.currentUser;
          final short = snapshot.data;
          return ScaffoldTemplate(
              title: HomeStrings.home.title,
              appBarActions: [
                Padding(
                  padding: const EdgeInsets.only(left: cPadding16, top: cPadding8),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColors.secondary,
                        backgroundImage: NetworkImage(user!.photoURL!),
                      ),
                      const SizedBox(width: cPadding8),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const AppText.regular(
                            text: 'Bem vindo,',
                            fontSize: cFontSize14,
                            color: AppColors.darkGrey,
                            textAlign: TextAlign.start,
                          ),
                          AppText.medium(
                            text: user.displayName!,
                            fontSize: cFontSize14,
                            color: AppColors.black,
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: cPadding16, top: cPadding8),
                  child: TextButton.icon(
                      onPressed: () async {
                        await FirebaseAuth.instance.signOut();
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.logout,
                        color: AppColors.red,
                      ),
                      label: const AppText.regular(
                        text: 'Sair ',
                        fontSize: cFontSize14,
                        color: AppColors.red,
                      )),
                ),
              ],
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: cSize24),
                  const SearchBar(),
                  const SizedBox(height: cSize24),
                  const CategoryHeader(),
                  const DemoToggleButtons(),
                  const SizedBox(height: cSize16),
                  const CardListHeader(),
                  const SizedBox(height: cSize16),
                  Expanded(
                      child: CardList(
                    short: short!,
                  )),
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
              ));
        }

        return const Material(child: Center(child: Text("loading")));
      },
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
              Container(
                height: 5,
                width: 75,
                decoration: BoxDecoration(
                  color: AppColors.lightGrey30,
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
              const SizedBox(height: cSize32),
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

class CategoryHeader extends StatelessWidget {
  const CategoryHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        AppText.medium(
          text: 'Categorias',
          fontSize: cFontSize16,
          color: AppColors.black,
        ),
        SizedBox(height: cSize8),
      ],
    );
  }
}

class CardListHeader extends StatelessWidget {
  const CardListHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppText.medium(
          text: HomeStrings.home.shortLinks,
          fontSize: cFontSize16,
          color: AppColors.black,
        ),
        const SizedBox(width: cSize8),
        Container(
          height: cSize24,
          decoration: const BoxDecoration(
            color: AppColors.secondary,
            borderRadius: BorderRadius.all(Radius.circular(cSize8)),
          ),
          padding: const EdgeInsets.symmetric(horizontal: cPadding16),
          child: AppText.bold(
            text: HomeStrings.home.totalLinks(2),
            fontSize: cFontSize16,
            color: AppColors.white,
          ),
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
      height: 55,
      padding: const EdgeInsets.all(cPadding16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            AppAssets.vectors.svgIconSearch,
            color: AppColors.darkGrey,
          ),
          const SizedBox(width: cSize8),
          const AppText.medium(
            text: 'Procurar Link',
            fontSize: cFontSize18,
            color: AppColors.darkGrey,
          )
        ],
      ),
    );
  }
}

class CardList extends StatelessWidget {
  final List<Short> short;
  const CardList({Key? key, required this.short}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: short.length,
        itemBuilder: (context, index) {
          final s = short[index];
          return Padding(
            padding: EdgeInsets.only(bottom: index != 9 ? cPadding16 : 120),
            child: CardListItem(short: s),
          );
        });
  }
}

class CardListItem extends StatelessWidget {
  final Short short;
  const CardListItem({Key? key, required this.short}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.all(cPadding16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Row(
        children: [
          Container(
              height: 50,
              width: 50,
              padding: const EdgeInsets.all(cPadding8),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.secondary,
              ),
              child: const Icon(
                Icons.person,
                color: AppColors.white,
              )),
          const SizedBox(width: cSize16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText.medium(
                text: short.title,
                fontSize: cFontSize14,
                color: AppColors.darkGrey,
              ),
              const AppText.light(
                text: '247 visitas',
                fontSize: cFontSize14,
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

class DemoToggleButtons extends StatefulWidget {
  const DemoToggleButtons({Key? key}) : super(key: key);

  @override
  _DemoToggleButtonsState createState() => _DemoToggleButtonsState();
}

class _DemoToggleButtonsState extends State<DemoToggleButtons> {
  List<bool> isSelected = [true, false, false];
  List<IconData> iconList = [Icons.person, Icons.call, Icons.web];

  @override
  Widget build(BuildContext context) {
    return Ink(
      width: 200,
      height: 60,
      color: Colors.white,
      child: GridView.count(
        primary: true,
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        childAspectRatio: 1,
        children: List.generate(isSelected.length, (index) {
          return InkWell(
              splashColor: AppColors.secondary,
              onTap: () {
                setState(() {
                  for (int indexBtn = 0; indexBtn < isSelected.length; indexBtn++) {
                    if (indexBtn == index) {
                      isSelected[indexBtn] = true;
                    } else {
                      isSelected[indexBtn] = false;
                    }
                  }
                });
              },
              child: Ink(
                decoration: BoxDecoration(
                  color: isSelected[index] ? AppColors.secondary : AppColors.lightGrey20,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: isSelected[index] ? AppColors.secondary : AppColors.lightGrey10,
                  ),
                ),
                child: Icon(
                  iconList[index],
                  color: isSelected[index] ? Colors.white : AppColors.grey,
                ),
              ));
        }),
      ),
    );
  }
}
