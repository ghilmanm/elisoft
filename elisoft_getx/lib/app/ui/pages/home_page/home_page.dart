import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/home_controller.dart';
import '../../global_widgets/skelton.dart';
import '../../utils/constants/color.dart';
import 'article_item.dart';
import 'top_article_item.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.isLoading.value
            ? const LoadingSkeleton()
            : RefreshIndicator(
                onRefresh: () => controller.onGetArticles(),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  child: SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Obx(
                          () => Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 18.0),
                            child: RichText(
                              text: TextSpan(
                                text: 'Welcome, ',
                                style: const TextStyle(
                                    fontSize: 22, color: Colors.black),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: controller.user.value,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22)),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 22),
                        Obx(
                          () => SizedBox(
                            height: 200,
                            child: ListView.separated(
                              separatorBuilder: (context, index) =>
                                  const SizedBox(width: 12),
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(
                                  parent: AlwaysScrollableScrollPhysics()),
                              itemCount: controller.listArticles.length,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 18.0),
                              itemBuilder: (context, index) {
                                return ArticleItemTop(
                                  title: controller.listArticles[index].title,
                                  desc: controller.listArticles[index].content,
                                );
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 22),
                        Obx(
                          () => ListView.separated(
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 12),
                            itemCount: controller.listArticles.length,
                            shrinkWrap: true,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 18.0),
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return ArticleItem(
                                title: controller.listArticles[index].title,
                                desc: controller.listArticles[index].content,
                                img: controller.listArticles[index].image,
                                date: controller
                                    .listArticles[index].user?.created?.date,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await controller.onGetArticles();
        },
        backgroundColor: BUTTON_COLOR,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

class LoadingSkeleton extends StatelessWidget {
  const LoadingSkeleton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                Skelton(
                  height: 28,
                  width: 90,
                ),
                SizedBox(width: 8),
                Skelton(
                  height: 28,
                  width: 180,
                ),
              ],
            ),
            const SizedBox(height: 22),
            SizedBox(
              height: 200,
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(width: 12),
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Skelton(
                        height: 28,
                        width: 120,
                      ),
                      SizedBox(height: 8),
                      Skelton(
                        height: 160,
                        width: 160,
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 22),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 12),
                itemCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Skelton(height: 90, width: 90),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Skelton(height: 24),
                                  SizedBox(height: 8),
                                  Skelton(height: 24, width: 120),
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: const [
                            Expanded(child: Skelton(height: 100))
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [Skelton(height: 24, width: 180)],
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
