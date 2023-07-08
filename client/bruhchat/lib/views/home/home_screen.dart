import 'package:bruhchat/views/home/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => HomeViewModel(),
        disposeViewModel: false,
        onViewModelReady: (viewModel) {
          viewModel.socketInit();
          viewModel.initChats();
        },
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Bruhchat"),
            ),
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
                                final msgs = viewModel.allMessages[index];
                                return ListTile(
                                  title: Text(msgs.message.toString()),
                                  subtitle: Text(msgs.sender.toString()),
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
