import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:public_apis_org/application_layer/home/api_detail_screen.dart';
import 'package:public_apis_org/application_layer/home/cubit/fetch_public_apis_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<FetchPublicApisCubit>().fetchPublicApis();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Public Apis'),
      ),
      body: SafeArea(
        child: BlocConsumer<FetchPublicApisCubit, FetchPublicApisState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is FetchPublicApisSuccess) {
              final publicApis = state.publicApiModel.entries;
              return ListView.separated(
                itemCount: state.publicApiModel.count,
                itemBuilder: ((context, index) => Container(
                      padding: const EdgeInsets.all(24),
                      height: MediaQuery.of(context).size.height * .3,
                      clipBehavior: Clip.antiAlias,
                      width: double.infinity,
                      decoration: const BoxDecoration(),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: MediaQuery.of(context).size.height * .2,
                              width: double.infinity,
                              padding: const EdgeInsets.all(24),
                              decoration: BoxDecoration(
                                  gradient: const LinearGradient(colors: [
                                    Color(0xff5936B4),
                                    Color(0xff362A84),
                                  ]),
                                  borderRadius: BorderRadius.circular(24)),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: double.infinity,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .4,
                                            child: Text(
                                              '${publicApis[index].api}',
                                              style: const TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                color: Colors.white,
                                                fontSize: 24,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          ElevatedButton(
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (builder) =>
                                                            ApiDetailScreen(
                                                                entryModel:
                                                                    publicApis[
                                                                        index])));
                                              },
                                              child: Text(
                                                'view details'.toUpperCase(),
                                              )),
                                          const Expanded(child: SizedBox()),
                                          Expanded(
                                            child: Text(
                                              '${publicApis[index].category}',
                                              style: const TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ]),
                                  ]),
                            ),
                          ),
                          Positioned(
                              top: 0,
                              right: -10,
                              child: publicApis[index].https == true
                                  ? const Icon(
                                      Icons.lock,
                                      size: 150,
                                      color: Colors.white,
                                      shadows: [
                                        BoxShadow(
                                            spreadRadius: 8,
                                            color: Color(0xff2C3055),
                                            blurRadius: 4,
                                            offset: Offset(2, 4))
                                      ],
                                    )
                                  : const Icon(
                                      Icons.lock_open,
                                      size: 150,
                                      color: Colors.white,
                                      shadows: [
                                        BoxShadow(
                                            spreadRadius: 8,
                                            color: Color(0xff2C3055),
                                            blurRadius: 4,
                                            offset: Offset(2, 4))
                                      ],
                                    ))
                        ],
                      ),
                    )),
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 8,
                  );
                },
              );
            } else if (state is FetchPublicApisLoading) {
              return const Center(
                child: LoadingIndicator(colors: [
                  Color(0xff48319D),
                  Color(0xff1F1D47),
                  Color(0xff1F1D47),
                  Color(0xffE0D9FF),
                ], indicatorType: Indicator.orbit),
              );
            } else if (state is FetchPublicApisFailed) {
              return Center(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                          color: Colors.white.withAlpha(9),
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                              width: 1, color: const Color(0xff48319D))),
                      child: Text(
                        state.errorMessage,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    ElevatedButton(
                        onPressed: () => context
                            .read<FetchPublicApisCubit>()
                            .fetchPublicApis(),
                        child: const Text(
                          'Try Again',
                        ))
                  ],
                ),
              ));
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
