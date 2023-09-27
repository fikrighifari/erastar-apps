part of 'reusable_components.dart';

class UiUtils {
  static errorMessage(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: AppColor.primayRedColor,
      behavior: SnackBarBehavior.floating,
      elevation: 30,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height - 100,
          right: 20,
          left: 20),
    ));
  }

  static successMessage(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: AppColor.greenColor,
      behavior: SnackBarBehavior.floating,
      // margin: EdgeInsets.all(50),
      elevation: 30,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height - 100,
          right: 20,
          left: 20),
    ));
  }

  static errorMessageClose(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: AppColor.naturalGrey1,
      behavior: SnackBarBehavior.floating,
      elevation: 30,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      // margin: EdgeInsets.only(
      //     bottom: MediaQuery.of(context).size.height - 100,
      //     right: 20,
      //     left: 20),
    ));
  }

  static customLoadingCircle(BuildContext context) {
    return Center(
      child: Container(
        // padding: const EdgeInsets.only(bottom: 20),
        child: Lottie.asset(
          "assets/lottie/app_line_circle_loading.json",
          width: MediaQuery.of(context).size.width * 0.5,
          // width: 140,
        ),
        //     CircularProgressIndicator(
        //   color: AppColor.secondaryColor(),
        // ),
      ),
    );
  }

  static customLoadingSuccessAbsen(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.black.withOpacity(0.1),
      child: Center(
        child: Container(
          padding: const EdgeInsets.only(bottom: 20),
          child: Lottie.asset(
            "assets/lottie/sand_timer.json",
            width: MediaQuery.of(context).size.width * 0.6, fit: BoxFit.cover,
            // width: 140,
          ),
        ),
      ),
    );
  }

  static customShimmerProfile(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomContainer(
            padding: EdgeInsets.all(defaultMargin),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 24),
                      child: SizedBox(
                        height: 96,
                        width: 96,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: const CircleAvatar(
                                backgroundColor: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: const CustomContainer(
                              radius: 10,
                              height: 15,
                              width: 200,
                              backgroundColor: AppColor.whiteColor,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: const CustomContainer(
                              radius: 10,
                              height: 15,
                              width: 120,
                              backgroundColor: AppColor.whiteColor,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: const CustomContainer(
                              radius: 10,
                              height: 16,
                              width: 100,
                              backgroundColor: AppColor.whiteColor,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: const CustomContainer(
                              radius: 10,
                              height: 16,
                              width: 120,
                              backgroundColor: AppColor.whiteColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 12,
                  ),
                  child: const Divider(
                    color: AppColor.naturalGrey2,
                  ),
                ),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        right: 10,
                      ),
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: const CustomContainer(
                          radius: 5,
                          height: 35,
                          width: 35,
                          backgroundColor: AppColor.whiteColor,
                        ),
                      ),
                    ),
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: const CustomContainer(
                        radius: 10,
                        height: 16,
                        width: 120,
                        backgroundColor: AppColor.whiteColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: CustomContainer(
              padding: EdgeInsets.symmetric(
                horizontal: defaultMargin,
                vertical: defaultMargin,
              ),
              margin: EdgeInsets.only(top: defaultMargin),
              width: double.infinity,
              // backgroundColor: AppColor.redColor(),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      right: 10,
                    ),
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: const CustomContainer(
                        radius: 5,
                        height: 35,
                        width: 35,
                        backgroundColor: AppColor.whiteColor,
                      ),
                    ),
                  ),
                  Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: const CustomContainer(
                      radius: 10,
                      height: 16,
                      width: 120,
                      backgroundColor: AppColor.whiteColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
