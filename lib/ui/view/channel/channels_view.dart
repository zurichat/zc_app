<<<<<<< HEAD
// import 'package:flutter/material.dart';
=======

import 'package:flutter/material.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/ui/view/channel/channels_viewmodel.dart';
import 'package:hng/ui/view/channel/widgets/channel_browser_container.dart';
import 'package:stacked/stacked.dart';
import 'package:grouped_list/grouped_list.dart';


class ChannelList extends StatelessWidget {
  const ChannelList({ Key? key }) : super(key: key);
>>>>>>> 2738e2335b98f6a7c501a35afe04e3cf28f6a9d9

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChannelViewModel>.reactive(
      viewModelBuilder:()=>ChannelViewModel(), 
      builder: (context,model,child)=>Scaffold(
  backgroundColor: Color(0XFFF4F4F4),
        appBar: AppBar(
          leadingWidth: 16,
          centerTitle: false,
          backgroundColor: AppColors.whiteColor,
          leading: Padding(
            padding: const EdgeInsets.only(left:10.0),
            child: Icon(Icons.arrow_back_ios,color: Colors.black,
            size: 15,),
          ),
          titleSpacing: 0,
          title: ListTile(
              minLeadingWidth: 10,
              title: Text(
                "Channel Browser",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              subtitle: Text(
                "5 Channels",
                style: TextStyle(fontSize: 13),
              )),
        ),
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.093,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Center(
                  child: TextField(
                    decoration: InputDecoration(
                        isDense: true,
                        contentPadding:EdgeInsets.all(8.8),
                        labelText: "Search for channel...",
                        labelStyle: TextStyle(color: Color(0xffA1A9B3)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: GroupedListView<dynamic,String>(
                  elements: model.channelsList,
                  groupBy: (elements)=>elements.toLowerCase()?[0],
                  groupSeparatorBuilder:(String value)=>Padding(
                    padding:EdgeInsets.symmetric(horizontal:14,vertical:8),
                    
                    child: Text(value.toUpperCase(),
                    style: TextStyle(fontSize:20,
                    fontWeight:FontWeight.bold),
                    ),
                  ) ,
                  itemBuilder: (context, element) {
                    return ChannelBrowserContainer(channelName:element);
                  },),
            ),
          ],
        ),
        ),
      ),
      );
  }
}
