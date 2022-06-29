import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/services/translator.dart';
import 'package:flutter_project/src/presentation/pages/user_detail_page/user_detail_page.dart';
import 'package:flutter_project/src/presentation/widgets/user_card_widget.dart';
import 'package:flutter_project/src/state_managers/users_page_cubit/users_page_cubit.dart';
import 'package:get_it/get_it.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: GetIt.I<UsersPageCubit>()..getUsers(),
      child: RefreshIndicator(
        onRefresh: () async {
          GetIt.I<UsersPageCubit>().getUsers(isReload: true);
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(GetIt.I<TranslatorService>().translate(
              context,
              'label.pages.users.title',
            )),
          ),
          body: _builder(context),
        ),
      ),
    );
  }

  Widget _builder(BuildContext context) {
    return BlocConsumer<UsersPageCubit, UsersPageState>(
      listener: (context, state) {
        if (state.failure != null) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              GetIt.I<TranslatorService>().translate(
                context,
                'error.${state.failure?.code}',
              ),
            ),
          ));
        }
      },
      builder: (context, state) {
        return ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          children: [
            Column(
              children: state.users.map((user) {
                return UserCardWidget(
                  user: user,
                  onTap: (context) {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => UserDetailPage(
                        id: user.id,
                      ),
                    ));
                  },
                );
              }).toList(),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: state.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                      onPressed: () {
                        GetIt.I<UsersPageCubit>().getUsers();
                      },
                      child: Text(
                        GetIt.I<TranslatorService>().translate(
                          context,
                          'label.button.loadMore',
                        ),
                      ),
                    ),
            ),
          ],
        );
      },
    );
  }
}
