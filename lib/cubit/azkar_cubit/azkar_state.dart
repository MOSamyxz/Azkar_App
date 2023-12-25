abstract class AzkarState {}

class AppInitialStats extends AzkarState {}

class AzkarCategoryLoadedState extends AzkarState {}

class AzkarCategoryLoadingState extends AzkarState {}

final class FavAzkarLoadingState extends AzkarState {}

final class FavAzkarLoadedState extends AzkarState {}

final class RemoveFavoriteState extends AzkarState {}

final class AddFavoriteState extends AzkarState {}

final class ListEmptyState extends AzkarState {}

final class FilterListState extends AzkarState {}

final class SalahTimeFailState extends AzkarState {}

final class SalahTimeLoadingState extends AzkarState {}

final class NoSalahTimeState extends AzkarState {}

final class SalahLoadState extends AzkarState {}
