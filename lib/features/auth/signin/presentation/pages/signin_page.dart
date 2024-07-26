import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/core/common/widgets/auth_header_widget.dart';
import 'package:spotify/core/common/widgets/custom_text_field.dart';
import 'package:spotify/core/common/widgets/show_snackbar_widget.dart';
import 'package:spotify/core/common/widgets/soild_button_widget.dart';
import 'package:spotify/core/constants/constatnts.dart';
import 'package:spotify/core/routes/app_router.gr.dart';
import 'package:spotify/core/theme/app_colors.dart';
import 'package:spotify/core/theme/text_style.dart';
import 'package:spotify/core/utils/validation_mixin.dart';
import 'package:spotify/features/auth/signin/presentation/bloc/auth_bloc.dart';

@RoutePage()
class SigninPage extends StatelessWidget with ValidationsMixin {
  SigninPage({super.key});

  final GlobalKey<FormState> signinForm = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: MultiBlocListener(
        listeners: [
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) async {
              if (state is AuthSuccessState) {
                showSnackBar(context, "User Sign in successfully",
                    isSuccess: true);
                context.router.replaceAll([const DashboardRoute()]);
              } else if (state is AuthFailureState) {
                showSnackBar(context, state.message, isSuccess: false);
              }
            },
          ),
        ],
        child: Scaffold(
          backgroundColor: kColorWhite,
          body: Stack(
            fit: StackFit.expand,
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 28.w),
                  child: Form(
                    key: signinForm,
                    child: Column(
                      children: [
                        SizedBox(height: 36.h),
                        //-- header
                        const AuthHeaderWidget(),
                        SizedBox(height: 48.h),
                        Text(
                          'Sign In',
                          style: kTextStyleSatoshiBold600.copyWith(
                            fontSize: 28.sp,
                            color: kColorBlack,
                          ),
                        ),
                        SizedBox(height: 16.h),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'If you need any support ',
                                style: kTextStyleSatoshiRegular400.copyWith(
                                  fontSize: 14.sp,
                                  color: kColorBlack,
                                ),
                              ),
                              TextSpan(
                                text: 'Click Here',
                                style: kTextStyleSatoshiRegular400.copyWith(
                                  fontSize: 14.sp,
                                  color: kColorPrimary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 26.h),
                        //-- register form
                        CustomTextfield(
                          controller: emailController,
                          hintText: 'Enter Email',
                          validator: validatedEmail,
                        ),
                        SizedBox(height: 16.h),
                        CustomTextfield(
                          controller: passwordController,
                          hintText: 'Password',
                          validator: validatedPassword,
                        ),
                        SizedBox(height: 34.h),
                        //-- create ac
                        SolidButtonWidget(
                          filledColor: kColorPrimary,
                          labelColor: kColorWhite,
                          fontSize: 18.sp,
                          label: 'Sign In',
                          onTap: () {
                            FocusScope.of(context).unfocus();

                            if (signinForm.currentState!.validate()) {
                              context.read<AuthBloc>().add(
                                    AuthSigninEvent(
                                      email: emailController.text.trim(),
                                      password: passwordController.text.trim(),
                                    ),
                                  );
                              print("Ac created successfully");
                              emailController.clear();
                              passwordController.clear();
                            }
                          },
                        ),
                        SizedBox(height: 60.h),
                        //-- divider
                        Row(
                          children: [
                            const Expanded(
                              child: Divider(
                                color: kColorLightGrey,
                                thickness: 0.6,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              child: Text(
                                'Or',
                                style: kTextStyleSatoshiMedium500.copyWith(
                                    fontSize: 14.sp),
                              ),
                            ),
                            const Expanded(
                              child: Divider(
                                color: kColorLightGrey,
                                thickness: 0.6,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 40.h),
                        //-- social login
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              Constatnts.googleIC,
                              fit: BoxFit.cover,
                              height: 28.h,
                              width: 28.w,
                            ),
                            SizedBox(width: 60.w),
                            SvgPicture.asset(
                              Constatnts.appleIC,
                              fit: BoxFit.cover,
                            )
                          ],
                        ),
                        SizedBox(height: 46.h),
                        //-- sigin in
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Not a member?',
                                style: kTextStyleSatoshiMedium500.copyWith(
                                  fontSize: 16.sp,
                                  color: kColorBlack,
                                ),
                              ),
                              TextSpan(
                                text: ' Register Now',
                                style: kTextStyleSatoshiMedium500.copyWith(
                                  fontSize: 16.sp,
                                  color: const Color(0xff288CE9),
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    context.router.replace(SignupRoute());
                                  },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
                if (state is AuthLoadingState) {
                  return Container(
                    color: Colors.black.withOpacity(0.4),
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: kColorPrimary,
                      ),
                    ),
                  );
                }
                return const SizedBox();
              })
            ],
          ),
        ),
      ),
    );
  }
}
