import 'package:book/Componnents/table.dart';
import 'package:book/Form/Screen/BookList.dart';
import 'package:book/Form/Screen/Dashboard.dart';
import 'package:book/Form/Screen/FormWidget.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';

class SideBar extends StatefulWidget {
  const SideBar({
    super.key,
    required this.sideMenu,
    required this.pageController,
  });

  final SideMenuController sideMenu;
  final PageController pageController;

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SideMenu(
            controller: widget.sideMenu,
            style: SideMenuStyle(
                // showTooltip: false,

                displayMode: SideMenuDisplayMode.auto,
                // showHamburger: true,
                hoverColor: Colors.blue[100],
                selectedHoverColor: Colors.blue[100],
                selectedColor: Colors.lightBlue,
                selectedTitleTextStyle: const TextStyle(color: Colors.white),
                selectedIconColor: Colors.white,
                openSideMenuWidth: 200,

                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.all(Radius.circular(10)),
                // ),
                backgroundColor: Colors.grey[200]),
            title: Column(
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxHeight: 120,
                    maxWidth: 120,
                  ),
                  child: Image.asset(
                    'assets/images/r_care.png',
                    fit: BoxFit.cover,
                    width: 200,
                    height: 100,
                  ),
                ),
                const Divider(
                  indent: 8.0,
                  endIndent: 8.0,
                ),
              ],
            ),
            footer: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.lightBlue[50],
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                  // child: Text(
                  //   'CARE',
                  //   style: TextStyle(fontSize: 15, color: Colors.grey[800]),
                  // ),
                ),
              ),
            ),
            items: [
              SideMenuItem(
                title: 'Dashboard',
                onTap: (index, _) {
                  widget.sideMenu.changePage(index);
                },
                icon: const Icon(Icons.home),
                // badgeContent: const Text(
                //   '3',
                //   style: TextStyle(color: Colors.white),
                // ),
                tooltipContent: "This is a tooltip for Dashboard item",
              ),
              SideMenuItem(
                title: 'Form',
                onTap: (index, _) {
                  widget.sideMenu.changePage(index);
                },
                icon: const Icon(Icons.drive_file_rename_outline_outlined),
              ),
              SideMenuItem(
                title: 'Book List',
                onTap: (index, _) {
                  widget.sideMenu.changePage(index);
                },
                icon: const Icon(
                  Icons.book_rounded,
                ),
              ),
            ],
          ),
          const VerticalDivider(
            width: 0,
          ),
          Expanded(
            child: PageView(
              allowImplicitScrolling: true,
              controller: widget.pageController,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 5, left: 10, right: 10),
                  child: Container(color: Colors.white, child: Dashboard()),
                ),
                Container(
                  color: Colors.white,
                  child: Center(
                    child: Center(child: FormWidget()),
                  ),
                ),
                Container(color: Colors.white, child: BookListScreen()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
