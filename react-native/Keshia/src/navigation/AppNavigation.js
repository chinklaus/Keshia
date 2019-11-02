import React, { Component } from 'react';
import { createAppContainer } from 'react-navigation';
import { createStackNavigator } from 'react-navigation-stack';
import HomeView from '../screen/HomeView';
import employeeView from '../screen/employeeView';

const MainStack = createStackNavigator({
    HomeScreen: {
      screen: HomeView,
      navigationOptions: {
        header: null
      }
    },
  employeeScreen: {
    screen: employeeView,
    navigationOptions: {
      header: null
    }
  } 
});

const AppStackNavigator = createStackNavigator(
  {
    MainScreen: {
      screen: MainStack,
    },
  },
  {
    mode: 'modal',
    headerMode: 'none',
    transparentCard: true,
  }
);

export default createAppContainer(AppStackNavigator);