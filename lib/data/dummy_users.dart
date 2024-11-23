import 'package:flutter/foundation.dart';
import 'package:myapp/models/user.dart';

const DUMMY_USERS ={
   '1' : const User(
       id: '1',
       name: 'Maria',
       email: 'maria123@gmail.com',
       avatarUrl: 'https://cdn.pixabay.com/photo/2014/04/02/14/10/female-306407_1280.png'
   ),
   '2' : const User( 
        id: '2',
        name: 'Rafael',
        email: 'rafinha1045@gmail.com',
        avatarUrl: 'https://cdn.pixabay.com/photo/2013/07/12/19/15/gangster-154425_960_720.png'
   ),
   '3' : const User( 
        id: '3',
        name: 'Pedro',
        email: 'Pedrosaliente2020@gmail.com',
        avatarUrl: 'https://cdn.pixabay.com/photo/2016/03/31/19/58/avatar-1295430_1280.png'
   ),
}