class SliderModel {
  final String title;
  final String description;
  final String? imageURL;

  SliderModel({
    this.title = '',
    this.description = '',
    this.imageURL,
  });
}

List<SliderModel> sliders = [
  SliderModel(
    title: 'Filmes, séries e muito mais, sem limites',
    description: 'Assista onde quiser. Cancele quando quiser',
  ),
  SliderModel(
    title: 'Baixe e assista offline',
    description: 'Tenha sempre algo para assistir offline.',
    imageURL: 'assets/images/img_download_movies.png',
  ),
  SliderModel(
    title: 'Sem compromisso',
    description: 'Assine hoje, cancele quando quiser',
    imageURL: 'assets/images/img_no_compromisse.png',
  ),
  SliderModel(
    title: 'Assista onde quiser',
    description: 'Assista no celular, tablet, laptop, TV ou outros aparelhos.',
    imageURL: 'assets/images/img_multiple_devices.jpg',
  ),
];
