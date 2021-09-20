import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hng/ui/shared/colors.dart';
import '../../../general_widgets/custom_channel.dart';
import '../../../general_widgets/custom_channel_stage.dart';
import '../../../general_widgets/custom_user_channel.dart';
import 'dm_jump_to_viewmodel.dart';
import 'package:stacked/stacked.dart';

class DmJumpToView extends StatelessWidget {
  const DmJumpToView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DmJumpToViewModel>.reactive(
      onModelReady: (model) => model.fetchUsers(),
      disposeViewModel: false,
      viewModelBuilder: () => DmJumpToViewModel(),
      builder: (BuildContext context, DmJumpToViewModel model, Widget? child) =>
          Scaffold(
            backgroundColor: Colors.white,
            resizeToAvoidBottomInset: false,
            body: SafeArea(
              child: Stack(
                children: [
                  model.userSearch.isEmpty ? SizedBox() : Center(child: CircularProgressIndicator(),),
                  GestureDetector(
                    onTap: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(25, 20, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 40,
                            width: 361,
                            child: TextField(
                              controller: model.controller,
                              keyboardType: TextInputType.visiblePassword,
                              maxLines: 1,
                              onChanged: model.onChanged,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(5)),
                                  borderSide: BorderSide(
                                      color: AppColors.borderColor,
                                      width: 0.5,
                                      style: BorderStyle.solid),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(5)),
                                  borderSide: BorderSide(
                                      color: AppColors.borderColor,
                                      width: 0.5,
                                      style: BorderStyle.solid),
                                ),
                                prefixIcon: IconButton(
                                  icon:Icon(Icons.arrow_back_ios_outlined),
                                  iconSize: 18,
                                  onPressed: () => model.navigateBack(),
                                ),
                                hintText: 'Jump to...',
                                hintStyle: TextStyle(
                                  color: Color(0xffA1A9B3),
                                  fontSize: 14.4,
                                  height: 3.2,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),

                          Expanded(
                            child: ListView(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              physics: BouncingScrollPhysics(),
                              children: [
                                const SizedBox(height: 24),
                                model.list.isEmpty ?  Container():Container(
                                  height: 88,
                                  child: ListView.separated(
                                    physics: BouncingScrollPhysics(),
                                    separatorBuilder: (BuildContext context, int index) {
                                      return SizedBox(
                                        width: 16,
                                      );
                                    },
                                    itemBuilder: (context, index) {
                                      return model.list[index];
                                    },
                                    scrollDirection: Axis.horizontal,
                                    itemCount: model.list.length,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Container(
                                  height: 16,
                                  width: 37,
                                  child: const Text(
                                    'Recent',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 24),
                                const CustomChannel(text: 'announcement'),
                                const SizedBox(height: 24),
                                const CustomChannelStage(
                                    leadingIcon: Icons.lock_outlined, text: 'stage4'),
                                const SizedBox(height: 24),
                                const CustomUserChannel(
                                    image: 'assets/images/Rectangle 138a.png',
                                    text: 'OyinkanUA',
                                    text2: 'Oyin Bolaji',
                                    trailingIcon: Icons.circle_outlined),
                                const SizedBox(height: 24),
                                const CustomChannel(text: 'general'),
                                const SizedBox(height: 24),
                                const CustomChannelStage(
                                  leadingIcon: Icons.lock_outlined,
                                  text: 'design_stage10',
                                ),
                                const SizedBox(height: 24),
                                const CustomUserChannel(
                                  image: 'assets/images/Rectangle 138a.png',
                                  text: 'Abd_Salam',
                                  text2: 'rrrr',
                                  trailingIcon: Icons.circle,
                                  iconColor: Color(0xff007952),
                                ),
                                const SizedBox(height: 24),
                                const CustomChannel(text: 'announcement'),
                                const SizedBox(height: 24),
                                const CustomChannelStage(
                                    leadingIcon: Icons.lock_outlined, text: 'stage4'),
                                const SizedBox(height: 24),
                                const CustomUserChannel(
                                  image: 'assets/images/Rectangle 138a.png',
                                  text: 'Blaze',
                                  text2: 'rrrr',
                                  trailingIcon: Icons.circle,
                                  iconColor: Color(0xff007952),
                                ),
                                const SizedBox(height: 24),
                                const CustomChannel(text: 'announcement'),
                                const SizedBox(height: 24),
                                const CustomChannelStage(
                                    leadingIcon: Icons.lock_outlined, text: 'stage4'),
                                const SizedBox(height: 24),
                                const CustomChannel(text: 'announcement'),
                                const SizedBox(height: 24),
                                const CustomChannelStage(
                                    leadingIcon: Icons.lock_outlined, text: 'stage4'),
                                const SizedBox(height: 24),
                                const CustomUserChannel(
                                  image: 'assets/images/Rectangle 138a.png',
                                  text: 'Blaze',
                                  text2: 'rrr',
                                  trailingIcon: Icons.circle,
                                  iconColor: Color(0xff007952),
                                ),
                                const SizedBox(height: 24),
                                const CustomChannel(text: 'announcement'),
                                const SizedBox(height: 24),
                                const CustomChannelStage(
                                    leadingIcon: Icons.lock_outlined, text: 'stage4'),
                                const SizedBox(height: 24),
                                const CustomChannel(text: 'announcement')
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }
}