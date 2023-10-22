part of 'bmi_claculate_cubit.dart';

@immutable
abstract class BmiClaculateState {}

class BmiClaculateInitial extends BmiClaculateState {}
class UpdateHightState extends BmiClaculateState {}


class BmiCalculatefunctionState extends BmiClaculateState {}
class ToCmfunctionState extends BmiClaculateState {}
class ToMeterfunctionState extends BmiClaculateState {}
class ToFeetfunctionState extends BmiClaculateState {}
class ChangeTabHightfunctionState extends BmiClaculateState {}
class ChangeTabWightfunctionState extends BmiClaculateState {}
class ToKGSfunctionState extends BmiClaculateState {}
class ToLBSfunctionState extends BmiClaculateState {}
class UpdatePanfunctionState extends BmiClaculateState {}
class SelectedLabelIndexfunctionState extends BmiClaculateState {}

