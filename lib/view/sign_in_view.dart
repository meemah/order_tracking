// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:order_tracking/shared/utils/styles/app_styles.dart';
import 'package:order_tracking/shared/utils/theme/app_colors.dart';
import 'package:order_tracking/shared/widgets/app_spacing.dart';
import 'package:order_tracking/shared/widgets/sign_up_button.dart';
import 'package:order_tracking/view/home_view.dart';
import 'package:order_tracking/viewmodel/auth_viewmodel.dart';
import 'package:provider/provider.dart';

import '../shared/utils/network_helper/network_data_response.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/shopping.png"))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              Text(
                "Order your\nfavourite foods!",
                style: AppStyle.largeTextRegular(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const YMargin(8),
              Text(
                "Eat fresh food and be healthy",
                style: AppStyle.mediumTextRegular(
                  color: AppColors.greyScale3,
                ),
              ),
              const YMargin(20),
              Consumer<AuthViewModel>(builder: (ctx, viewModel, _) {
                return Row(
                  children: [
                    Expanded(
                        child: SignInButton(
                            isLoading: viewModel.googleSignInResponse.status ==
                                Status.LOADING,
                            color: Colors.red,
                            imageUrl: "assets/icons/google.png",
                            onTap: () async {
                              await viewModel.googleSignIn();
                              if (viewModel.googleSignInResponse.status ==
                                      Status.COMPLETED &&
                                  viewModel.googleSignInResponse.data != null) {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (ctx) {
                                  return HomeView(
                                    userCredential:
                                        viewModel.googleSignInResponse.data!,
                                  );
                                }));
                              }
                            })),
                    const XMargin(10),
                    Expanded(
                        child: SignInButton(
                            isLoading: viewModel.githubSignInResponse.status ==
                                Status.LOADING,
                            color: Colors.black,
                            imageUrl: "assets/icons/github.png",
                            onTap: () async {
                              await viewModel.gitHubSignIn();
                              if (viewModel.githubSignInResponse.status ==
                                      Status.COMPLETED &&
                                  viewModel.githubSignInResponse.data != null) {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (ctx) {
                                  return HomeView(
                                    userCredential:
                                        viewModel.githubSignInResponse.data!,
                                  );
                                }));
                              }
                            })),
                  ],
                );
              }),
              const YMargin(40),
            ],
          ),
        ),
      ),
    );
  }
}
