import 'package:flutter/material.dart';
import 'package:washing_track/presentation/common_widgets/search_result.dart';
import 'package:washing_track/presentation/resources/color_manager.dart';
import 'package:washing_track/presentation/resources/fonts_manager.dart';
import 'package:washing_track/presentation/resources/style_manager.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 5,
                  child: SearchBar(
                    leading: const Text("Search"),
                    trailing: const [Icon(Icons.cancel_rounded)],
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                    backgroundColor: MaterialStateProperty.all(
                        ColorManager.textFormLightGrey),
                    elevation: MaterialStateProperty.all(0),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Expanded(flex: 1, child: Text("Cancel"))
              ],
            ),
            const Divider(),
            const BuildSearchListTile(),
            const Divider(),
            const BuildSearchListTile(),
            const Divider(),
            const BuildSearchListTile(),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Recent",
              style: getBoldStyle(
                  color: ColorManager.black, fontSize: FontSize.s17),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Alpha Car Wash",
              style: getRegularStyle(
                  color: ColorManager.black, fontSize: FontSize.s20),
            ),
            const Divider(),
            Text(
              "LMC Car Wash & Lube",
              style: getRegularStyle(
                  color: ColorManager.black, fontSize: FontSize.s20),
            ),
            const Divider(),
            Text(
              "Prestige Hand Car Wash",
              style: getRegularStyle(
                  color: ColorManager.black, fontSize: FontSize.s20),
            )
          ],
        ),
      ),
    );
  }
}
