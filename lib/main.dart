import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/blocs/app_bloc.dart';
import 'package:flutterbloc/blocs/app_events.dart';
import 'package:flutterbloc/blocs/app_states.dart';
import 'package:flutterbloc/model/user_model.dart';
import 'package:flutterbloc/repos/repositories.dart';
import 'package:flutterbloc/screen/details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RepositoryProvider(
        create: (context) => UserRepositories(),
        child: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(
        RepositoryProvider.of<UserRepositories>(context),
      )..add(LoadUserEvents()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Normal"),
        ),
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserLoadingState) {
              return const Center(
                child: const CircularProgressIndicator(),
              );}
            if (state is UserloadedState) {
              List<UserModel> userList = state.users;
              return ListView.builder(
                  itemCount: userList.length,
                  itemBuilder: (_, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailsScreen(e: userList[index]),
                          ),
                        );
                      },
                      child: Card(
                        color: Colors.blue,
                        elevation: 5,
                        margin: const EdgeInsets.all(10),
                        child: ListTile(
                          title: Text(userList[index].firstname),
                          subtitle: Text(userList[index].lastname),
                          trailing: CircleAvatar(
                            backgroundImage:
                                NetworkImage(userList[index].avatar),
                          ),
                        ),
                      ),
                    );
                  });
            }

            if (state is UserErrorState) {
              return Center(
                child: Text("error"),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
