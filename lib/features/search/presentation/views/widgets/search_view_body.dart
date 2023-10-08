import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trade_fashion/core/errors/failures.dart';
import 'package:trade_fashion/core/widgets/custom_circular_indicator.dart';
import 'package:trade_fashion/core/widgets/custom_error_widget.dart';
import '../../../../../constants.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../home/presentation/views/widgets/product_list_view.dart';
import '../../manager/search_cubit.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SearchCubit(),
        child: BlocBuilder<SearchCubit, SearchState>(builder: (context, state) {
          var cubit = SearchCubit.get(context);
          {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back_ios),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      CustomTextFormField(
                        onChange: (value) {
                          cubit.getSearch(value);
                        },
                        boarderRadius: 100,
                        prefix: Icons.search_outlined,
                        prefixColor: kPrimaryColor,
                        hintText: 'search',
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const Text(
                        'Search Result',
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      if (state is SearchSuccess)
                        ProductListView(productModel: cubit.searchProductModel),
                      if (state is SearchLoading)
                        const CustomCircularIndicator(),
                      if( state is SearchFailure)
                        const CustomErrorWidget(errorMessage: 'No Result'),
                      if(state is! SearchSuccess&&state is! SearchLoading && state is! SearchFailure)
                        const CustomErrorWidget(errorMessage: 'please enter any word'),



                    ],
                  ),
                ),
              ),
            );
          }
        }),
      ),
    );
  }
}
