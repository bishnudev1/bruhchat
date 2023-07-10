import 'package:auto_size_text/auto_size_text.dart';
import 'package:bruhchat/utils/themes/appstyles.dart';
import 'package:bruhchat/views/home/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeScreen extends StatelessWidget {
  //String username;
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => HomeViewModel(),
        disposeViewModel: false,
        onViewModelReady: (viewModel) {
          viewModel.socketInit();
          viewModel.initData();
        },
        builder: (context, viewModel, child) {
          return Scaffold(
            backgroundColor: Appstyles.backgroundColor,
            appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Appstyles.backgroundColor,
                title: const Text(
                  "Madhurima",
                  style: Appstyles.appBarHeadingStyle,
                ),
                elevation: 0,
                actions: [
                  InkWell(
                    onTap: () {},
                    child: const Icon(Icons.logout,
                        color: Appstyles.highlightColor),
                  ),
                  const SizedBox(
                    width: 10,
                  )
                ]),
            body: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Column(
                  children: [
                    viewModel.allMessages.isEmpty
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : Expanded(
                            child: ListView.builder(
                              itemCount: viewModel.allMessages.length,
                              itemBuilder: (context, index) {
                                final messages = viewModel.allMessages[index];
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Container(
                                    //height: 69,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 15),
                                    decoration: BoxDecoration(
                                        color: const Color(0xffF8F9FE),
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: MediaQuery.of(context).size.width*.6,
                                              child: AutoSizeText(
                                                messages.message,
                                                //maxLines: 1,
                                                style: viewModel
                                                            .currentUserEmail ==
                                                        messages.email
                                                    ? const TextStyle(
                                                        color: Color(0xff200C08),
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 14)
                                                    : const TextStyle(
                                                        color: Appstyles.cyan,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 14),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            RichText(
                                                text: TextSpan(
                                                    text: messages.sender,
                                                    style: const TextStyle(
                                                        color:
                                                            Color(0xff71727A),
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                    children: <InlineSpan>[
                                                  TextSpan(
                                                      text:
                                                          " - ${messages.createdAt.toString()}"
                                                              .toString(),
                                                      style: const TextStyle(
                                                          color:
                                                              Color(0xff71727A),
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w400))
                                                ])),
                                          ],
                                        ),
                                        IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                              Icons.arrow_forward_ios,
                                              size: 12,
                                              color: Color(0xff8F9098),
                                            ))
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: SafeArea(
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: viewModel.messageInputController,
                                decoration: const InputDecoration(
                                  hintText: 'Type your message here...',
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                if (viewModel.messageInputController.text
                                    .trim()
                                    .isNotEmpty) {
                                  viewModel.sendMessage();
                                }
                              },
                              icon: const Icon(Icons.send),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
