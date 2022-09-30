abstract class HomeEvent {}

class ChangeScreenEvent extends HomeEvent{}
class AppOpenEvent extends HomeEvent{}

class WaterScreenLoadEvent extends HomeEvent {}
class WaterScreenRefreshEvent extends HomeEvent {}
class WaterScreenAddEvent extends HomeEvent {}
class WaterScreenDeleteEvent extends HomeEvent {}

class SettingsLoadEvent extends HomeEvent {}
class SettingsChangeWeightEvent extends HomeEvent {}