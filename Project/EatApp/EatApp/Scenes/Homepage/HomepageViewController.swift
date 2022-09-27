//
//  HomepageViewController.swift
//  EatApp
//
//  Created by Canberk Bibican on 28.08.2022.
//

import UIKit

typealias HomepageSnapshot = NSDiffableDataSourceSnapshot<HomepageSections, HomepageCollectionDataItem> // --> viewmodele a taşı
private typealias DataSource = UICollectionViewDiffableDataSource<HomepageSections, HomepageCollectionDataItem>

enum HomepageCollectionDataItem: Hashable {
    case discountList(Discount)
    case categoryList(Category)
    case recommendList(Restuarant)
    case restuarantList(Restuarant)
}

enum HomepageSections {
    case discount, category, recommend, restuarant
}

protocol HomepageViewControllerProtocol: AnyObject {
    func configureCollectionView()
    func updateCollectionView(with snapShot: HomepageSnapshot)

    func discountDataSuccess()
    func discountDataError(error: Error)

    func categoryDataSuccess()
    func categoryDataError(error: Error)

    func recommendDataSuccess()
    func recommendDataError(error: Error)

    func restuarantListDataSuccess()
    func restuarantListDataError(error: Error)
}

class HomepageViewController: UIViewController {

    lazy var homepageViewModel: HomepageViewModelProtocol? = HomepageViewModel(homepageService: HomepageService())
    private var dataSource: DataSource!
    private var snapshot: HomepageSnapshot!

    @IBOutlet var homepageCollectionView: UICollectionView! {
        didSet {
            DiscountCollectionViewCell.registerCellXib(with: homepageCollectionView)
            CategoryCollectionViewCell.registerCellXib(with: homepageCollectionView)
            RecommendCollectionViewCell.registerCellXib(with: homepageCollectionView)
            RestuarantCollectionViewCell.registerCellXib(with: homepageCollectionView)
            homepageCollectionView.register(UINib(nibName: HeaderView.identifier, bundle: nil), forSupplementaryViewOfKind: HeaderView.ofKind, withReuseIdentifier: HeaderView.identifier)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        homepageViewModel?.setDelegate(viewControllerProtocol: self)
        configureCollectionView()
        homepageCollectionView.collectionViewLayout = createCompositionalLayout()
        snapshot = HomepageSnapshot()
        snapshot.appendSections([.discount, .category, .recommend, .restuarant])
    }

    func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { [weak self] (index, enviroment) -> NSCollectionLayoutSection? in
            return self?.createLayoutForSection(index: index, enviroment: enviroment)
        }
        return layout
    }

    func createLayoutForSection(index: Int, enviroment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? {
        switch index {
        case 0:
            return discountLayout()
        case 1:
            return categoryLayout()
        case 2:
            return recommendedLayout()
        case 3:
            return restuarantLayout()
        default:
            return nil
        }
    }

    func discountLayout() -> NSCollectionLayoutSection {

        let inset: CGFloat = 10

        //item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: inset, leading: inset, bottom: inset, trailing: inset)

        //group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(140))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)

        //section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging

        return section
    }

    func categoryLayout() -> NSCollectionLayoutSection {

        let inset: CGFloat = 2

        //item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: inset, leading: inset, bottom: inset, trailing: inset)

        //group
        let groupSize = NSCollectionLayoutSize(widthDimension: .estimated(130), heightDimension: .estimated(50))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)

        //section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous

        //supplementary
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(44))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: HeaderView.ofKind, alignment: .top)
        section.boundarySupplementaryItems = [header]

        return section
    }

    func recommendedLayout() -> NSCollectionLayoutSection {

        let inset: CGFloat = 10

        //item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.4), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: inset, leading: inset, bottom: inset, trailing: inset)

        //group
        let groupSize = NSCollectionLayoutSize(widthDimension: .estimated(300), heightDimension: .estimated(250))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)

        //section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous

        //supplementary
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(44))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: HeaderView.ofKind, alignment: .top)
        section.boundarySupplementaryItems = [header]

        return section
    }

    func restuarantLayout() -> NSCollectionLayoutSection {

        let inset: CGFloat = 10

        //item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: inset, leading: inset, bottom: inset, trailing: inset)

        //group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(120))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        //section
        let section = NSCollectionLayoutSection(group: group)

        //supplementary
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(44))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: HeaderView.ofKind, alignment: .top)
        section.boundarySupplementaryItems = [header]

        return section
    }

}

extension HomepageViewController: HomepageViewControllerProtocol {

    func updateCollectionView(with snapShot: HomepageSnapshot) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.dataSource.apply(snapShot, animatingDifferences: true)
            self.homepageCollectionView.reloadData()
        }
    }

    func configureCollectionView() {
        dataSource = DataSource(collectionView: homepageCollectionView, cellProvider: { (collectionView, indexPath, data) -> UICollectionViewCell? in
            switch data {
            case .discountList(let discount):
                guard let cell: DiscountCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: DiscountCollectionViewCell.identifier, for: indexPath) as? DiscountCollectionViewCell else {
                    return UICollectionViewCell()
                }
                cell.setup(discountModel: discount)
                return cell
            case .categoryList(let category):
                guard let cell: CategoryCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as? CategoryCollectionViewCell else {
                    return UICollectionViewCell()
                }
                cell.setup(categoryModel: category)
                return cell
            case .recommendList(let recommed):
                guard let cell: RecommendCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommendCollectionViewCell.identifier, for: indexPath) as? RecommendCollectionViewCell else {
                    return UICollectionViewCell()
                }
                cell.setup(recommendModel: recommed)
                return cell
            case .restuarantList(let restuarant):
                guard let cell: RestuarantCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: RestuarantCollectionViewCell.identifier, for: indexPath) as? RestuarantCollectionViewCell else {
                    return UICollectionViewCell()
                }
                cell.setup(restuarantModel: restuarant)
                return cell
            }
        })

        dataSource.supplementaryViewProvider = { collectionView, kind, indexPath in
            guard let view: HeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: HeaderView.ofKind, withReuseIdentifier: HeaderView.identifier, for: indexPath) as? HeaderView else {
                return UICollectionReusableView()
            }
            switch indexPath.section {
            case 0:
                view.title = ""
            case 1:
                view.title = "Category"
            case 2:
                view.title = "Recommended Restuarant"
            case 3:
                view.title = "All Restuarant"
            default:
                view.title = ""
            }
            return view
        }
    }

    func discountDataSuccess() {
        let data = homepageViewModel?.discountData
        self.snapshot.deleteItems(self.snapshot.itemIdentifiers(inSection: .discount))
        data!.discount!.forEach({ self.snapshot.appendItems([.discountList($0)], toSection: .discount) })
        self.updateCollectionView(with: snapshot)
    }

    func discountDataError(error: Error) {
        print(error)
    }

    func categoryDataSuccess() {
        let data = homepageViewModel?.categoryData
        self.snapshot.deleteItems(self.snapshot.itemIdentifiers(inSection: .category))
        data!.category!.forEach({ self.snapshot.appendItems([.categoryList($0)], toSection: .category) })
        self.updateCollectionView(with: snapshot)
    }

    func categoryDataError(error: Error) {
        print(error)
    }

    func recommendDataSuccess() {
        let data = homepageViewModel?.recommendData
        self.snapshot.deleteItems(self.snapshot.itemIdentifiers(inSection: .recommend))
        data!.recommendedList!.forEach({ self.snapshot.appendItems([.recommendList($0)], toSection: .recommend) })
        self.updateCollectionView(with: snapshot)
    }

    func recommendDataError(error: Error) {
        print(error)
    }

    func restuarantListDataSuccess() {
        let data = homepageViewModel?.restuarantListData
        self.snapshot.deleteItems(self.snapshot.itemIdentifiers(inSection: .restuarant))
        data!.restuarantList!.forEach({ self.snapshot.appendItems([.restuarantList($0)], toSection: .restuarant) })
        self.updateCollectionView(with: snapshot)
    }

    func restuarantListDataError(error: Error) {
        print(error)
    }


}

