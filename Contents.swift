import Foundation
import SwiftUI
import PlaygroundSupport


// MARK: - A Boolean Should Define a Condition
// Conditions should read clearly at call sites.

// has, is, should = IS NOT MANDATORY
var shouldRemove = false
var isRemoved = false
var hasRemovable = false

// without
var image = false
var data = false
var string = false
var productVoucher = false


/*
 Apple Usage
 */

do {
    let collectionView = UICollectionView()
    collectionView.isPagingEnabled = true
    collectionView.isUserInteractionEnabled = false
    collectionView.isPrefetchingEnabled = false
    collectionView.allowsFocus = false
    collectionView.allowsSelection = false
}
    
do {
    let view = UIView()
    view.isHidden = true
    view.accessibilityIgnoresInvertColors = true
    view.translatesAutoresizingMaskIntoConstraints = true
}

 Text("Yes")
    .allowsHitTesting(false) // enabled:
    .allowsTightening(false) // flag:
    .navigationBarBackButtonHidden(true) // hidesBackButton:
 
// with condition
var allowsImage = false
var dataWithFlags = false
var stringRemovable = false
var productWithinVoucher = false
var isProductWithVoucher = false


/*
 Real World Objects
 */

struct Door {
    var isLocked: Bool
    var isOpen: Bool
    
    mutating func open(locked: Bool) {
        if locked {
            isLocked = false
        }
        isOpen = true
    }
}

do {
    var door = Door(isLocked: true, isOpen: false)
    door.open(locked: door.isLocked) // unlocks then opens
    assert(door.isOpen && door.isLocked == false)
}
























// MARK: - Don’t Care About Type Name Length, Clear the Intention
// Prefer clarity over brevity for type names.

/*
 Apple Usage
 */
extension UICollectionViewCompositionalLayoutConfiguration {} // 5
extension UIViewControllerTransitioningDelegate {}
extension UIDocumentBrowserViewController {}
extension UIDocumentPickerViewController {}
extension UIViewControllerTransitionCoordinatorContext {}
extension UIPresentationController {}
extension UIAccessibilityCustomAction {}

extension NavigationSplitViewStyleConfiguration {} // 5
extension PreferenceKey {}
extension EnvironmentValues {}
extension GeometryProxy {}

extension JSONDecoder.NonConformingFloatDecodingStrategy {}
extension DateComponentsFormatter {}
extension URLSessionTaskDelegate {}
extension NSFileManagerUploadLocalVersionConflictPolicy {} // the longest: 7
extension NSFileProviderTestingChildrenEnumeration {}

extension NSUserActivityPersistentIdentifier.ExtendedGraphemeClusterLiteralType.EnumerationOptions.ArrayLiteralElement.Element {}
extension NSFileProviderIncrementalContentFetching {}
extension NSMapTableValueCallBacks {}

extension CAMediaTimingFunctionName {}
extension CALayerDelegate {}

// don't
class MovieVC: UIViewController {}
class MovieTableVC: UITableViewController {}


/*
 Real World Object
 */
struct EnvironmentFriendlyVehicleChargingStation {}
protocol UserAuthenticationServiceDelegate {}
class NetworkConnectivityMonitor {}
enum PaymentProcessingStatus { case pending, processing, succeeded, failed }
// struct USStockMarketBearishValueLongevityEachMinutes {}






















// MARK: - Past Tense or Future Tense for Methods. Present Tense, Past Tense or Verb for Closures and Functions
// Verb (Kata Kerja)
// methods are function that change the behavior of the objects, otherwise it's a function

/*
 Apple Usage
 */
protocol Messaging {
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) // method: past tense
}

class SampleViewController: UIViewController {
    override func viewDidLoad() { // method: past tense
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) { // method: future tense
        super.viewWillAppear(animated)
    }
}

struct AppDelegate {
    // methods: past tense
    func application(_ application: AppDelegate,
                     didFinishLaunchingWithOptions launchOptions: LaunchOptions?) -> Bool {
        return true
    }
    
    // closure: past tense
    let onValueChanged: ((Int) -> Void)? = { newValue in
        _ = newValue
    }
    // closure: present tense
    let onChangingStream: ((Int) -> Void)? = { newValue in
        _ = newValue
    }
    // closure: verb
    let onReceive: (() -> Void)? = {}
    let onComplete: (() -> Void)? = {}
    
    // function: verb.
    // closure: verb.
    func dismiss(completion: (() -> Void)? = nil) {
        // some process
        // then trigger
        completion?()
    }
}

extension AppDelegate {
    enum LaunchOptionsKey { case url }
    typealias LaunchOptions = [LaunchOptionsKey: String]
}


/*
 Real World Object
 */
class CoffeeMachine {
    var machinary: String = "Machine IS NOT working"
    var onCupFilled: (() -> Void)?
    
    func brewButtonPressed() {
        machinary = "Machine IS working"
        onCupFilled?()
    }
    
    func stopMachine() {}
}

























// MARK: - Avoid Directly Specifying Objects; Use Enum, Static or OptionSet Shorthand
 
/*
 Apple Usage
 */
do {
    var view = UIView()
    view.backgroundColor = .black
    view.tintColor = .white
    view.setContentHuggingPriority(.defaultLow, for: .horizontal)
    
    UIView.animate(.bouncy) {}
}

Text("random")
    .clipShape(Capsule()) // old
    .clipShape(.capsule) // new
    .animation(.linear, value: false)
    .navigationSplitViewStyle(ProminentDetailNavigationSplitViewStyle())
    .navigationSplitViewStyle(.prominentDetail)

Button(action: {}) {
    EmptyView()
}
.buttonStyle(PlainButtonStyle())
.buttonStyle(.plain)

/*
 Real World Objects
 */
protocol Car {}

struct SUV: Car {}
struct Jeep: Car {}

extension Car where Self == SUV {
    static var suv: Self { Self() }
}

extension Car where Self == Jeep {
    static var jeep: Self { Self() }
}

struct MyCar {
    let type: Car
}

let myCar = MyCar(type: SUV())
let myCar2 = MyCar(type: .suv)




















// MARK: - Dictionary with Enum as the Key

/*
 Apple Usage
 */
let delegate = AppDelegate()
let launched = delegate.application(delegate, didFinishLaunchingWithOptions: [.url: "https://uwais.framer.website"])
assert(launched)

let attributedString = NSAttributedString(
    string: "Hello, Uwais!",
    attributes: [
        .font: UIFont.systemFont(ofSize: 18, weight: .semibold),
        .foregroundColor: UIColor.systemBlue,
        .kern: 1.2, // spacing between letters
        .underlineStyle: NSUnderlineStyle.single.rawValue
    ]
)

/*
 Real World Objects
 */
enum FontWeight {
    case regular, bold, light
}
let fontWeights: [FontWeight: Double] = [
    .regular: 400,
    .bold: 700,
    .light: 300
]

enum RoomType {
    case bedroom
    case livingRoom
    case kitchen
    case bathroom
}
let roomSizes: [RoomType: Double] = [
    .bedroom: 150.0,
    .livingRoom: 200.0,
    .kitchen: 100.0,
    .bathroom: 50.0
]

let bedroomSize = roomSizes[.bedroom]






















// MARK: - Nested Types are Fine

/*
 Apple Usage
 */
extension NSUserActivityPersistentIdentifier.ExtendedGraphemeClusterLiteralType.EnumerationOptions.ArrayLiteralElement.Element {}

extension URLRequest.CachePolicy {}

/*
 Real World Objects
 */
struct CarWithEngine {
    enum EngineType {
        case gasoline
        case electric
        case hybrid
    }
    let engineType: EngineType
}
let eCar: CarWithEngine.EngineType = .electric
_ = eCar























// MARK: - Protocol is Behavior: Noun if Possible, or “-able” / “-ing”
// Noun (Kata Benda)

/*
 Apple Usage
 */
extension Decodable {}
extension Encodable {}
extension NSCoding {}
extension Numeric {}
extension Collection {}

/*
 Real World Objects
 */
protocol Vehicle {
    func move()
}

protocol Moving {
    func moving()
}

protocol Recyclable {
    func recycle()
}

struct Sedan: Vehicle {
    func move() { /* drive */ }
}

struct PlasticBottle: Recyclable {
    func recycle() { /* process */ }
}

extension Sedan: Moving {
    func moving() { /* decide */ }
}

do {
    let sedan = Sedan()
    sedan.move()
    sedan.moving()
    
    let bottle = PlasticBottle()
    bottle.recycle()
}





























// MARK: - Initializer over Function

/*
 Apple Usage
 */
do {
    let intValue = 100
    let asDouble = Double(intValue)
    let asFloat  = Float(intValue)
    let asString = String(intValue)
    let asBool   = Bool(truncating: NSNumber(value: intValue)) // niche case: non-zero => true
    let asCGFloat = CGFloat(intValue)
    _ = (asDouble, asFloat, asString, asBool as Any, asCGFloat)

    let doubleValue = 100.5
    let dToInt = Int(doubleValue)
    let dToFloat = Float(doubleValue)
    let dToString = String(doubleValue)
    let dToCGFloat = CGFloat(doubleValue)
    _ = (dToInt, dToFloat, dToString, dToCGFloat)

    let cgFloatValue: CGFloat = 42.75
    let gToInt = Int(cgFloatValue)
    let gToDouble = Double(cgFloatValue)
    let gToFloat = Float(cgFloatValue)
    let gToString = String(Double(cgFloatValue))
    _ = (gToInt, gToDouble, gToFloat, gToString)

    let urlString = "https://www.apple.com"
    let url = URL(string: urlString)
    _ = url

    // Example: initializer reference in higher-order functions
    let nums = [1, 2, 3]
    let joined = nums.map(String.init).joined(separator: ", ")
    assert(joined == "1, 2, 3")
}

/*
 Real World Object
 */
do {
    struct Motorcycle {}
    struct Car { init(_ source: Motorcycle) {} }
    struct Truck { init(_ source: Car) {} }
    struct Bus { init(from truck: Truck) {} }

    let car = Car(Motorcycle())
    let truck = Truck(car)
    let bus = Bus(from: truck)
}



















// MARK: - Naming: From the Most Generic to the Most Specific

/*
 Apple Usage
 */
extension UIView {}
extension UIButton {}
extension UITableView {}
extension UITableViewCell {}
extension UICollectionView {}
extension UICollectionViewCell {}
extension UIImageView {}
extension UITextField {}
extension UIScrollView {}
extension UIStackView {}
extension UILabel {}
extension UIActivityIndicatorView {}
extension UIWindow {}
extension UINavigationController {}
extension UITabBarController {}
extension UIAlertController {}

extension UITableViewDataSource {}
extension UITableViewDelegate {}
extension UIApplicationDelegate {}
extension UISceneDelegate {}

extension UICollectionViewCompositionalLayoutConfiguration {}
extension NSFileManagerUploadLocalVersionConflictPolicy {}

do {
    var tableView: UITableView = UITableView()
    var tableViewCell: UITableViewCell = UITableViewCell()
    var collectionView: UICollectionView = UICollectionView()
    var collectionViewCell: UICollectionViewCell = UICollectionViewCell()
    var imageView: UIImageView = UIImageView()
    var textField: UITextField = UITextField()
    var scrollView: UIScrollView = UIScrollView()
    var stackView: UIStackView = UIStackView()

    var urlSession: URLSession = URLSession(configuration: .default)
    var urlSessionTask: URLSessionTask? = nil
    var operationQueue: OperationQueue = OperationQueue()

    var appDelegate: UIApplicationDelegate? = nil
    var sceneDelegate: UISceneDelegate? = nil

    var mainViewController: UIView = UIView()
    var detailViewController: UIView = UIView()
    var contentView: UIView = UIView()
    var profileImageView: UIImageView = UIImageView()
    var errorLabel: UILabel = UILabel()
    var loadingSpinner: UIActivityIndicatorView = UIActivityIndicatorView()
    var loginButton: UIButton = UIButton()
    var cancelButton: UIButton = UIButton()
    var submitButton: UIButton = UIButton()
    var primaryActionButton: UIButton = UIButton()
    var secondaryActionButton: UIButton = UIButton()
    var backgroundImageView: UIImageView = UIImageView()
    var placeholderTextField: UITextField = UITextField()
    var avatarImageView: UIImageView = UIImageView()
    var headerTitleLabel: UILabel = UILabel()
    var footerDescriptionLabel: UILabel = UILabel()
    var mainWindow: UIWindow = UIWindow()
    var mainNavigationController: UINavigationController = UINavigationController()
    var rootTabBarController: UITabBarController = UITabBarController()

    let defaultNotificationCenter: NotificationCenter = .default
    let defaultFileManager: FileManager = .default
    let sharedUserDefaults: UserDefaults = .standard

    _ = (
        tableView, tableViewCell, collectionView, collectionViewCell, imageView, textField,
        scrollView, stackView, urlSession, urlSessionTask as Any, operationQueue,
        appDelegate as Any, sceneDelegate as Any, mainViewController, detailViewController,
        contentView, profileImageView, errorLabel, loadingSpinner, loginButton, cancelButton,
        submitButton, primaryActionButton, secondaryActionButton, backgroundImageView,
        placeholderTextField, avatarImageView, headerTitleLabel, footerDescriptionLabel,
        mainWindow, mainNavigationController, rootTabBarController,
        defaultNotificationCenter, defaultFileManager, sharedUserDefaults
    )
}

/*
 Real World Objects
 */
protocol USAGovernment {}
class IndonesiaPresident {}
struct GameAdventure {}
protocol PublicTransportation {}
class SchoolBus: PublicTransportation {}


















// MARK: - OptionSet is for Everything
/*
  Apple Usage
 */
Text("OptionSet")
    .padding(.all, 10)
    .padding([.top, .horizontal], 10)
    .edgesIgnoringSafeArea([.top, .bottom])
    .edgesIgnoringSafeArea(.leading)

/*
  Real World Objects
 */
struct PublicTransportOptions: OptionSet {
    let rawValue: Int

    static let bus            = PublicTransportOptions(rawValue: 1 << 0)
    static let train          = PublicTransportOptions(rawValue: 1 << 1)
    static let tram           = PublicTransportOptions(rawValue: 1 << 2)
    static let bikeStorage    = PublicTransportOptions(rawValue: 1 << 3)
    static let seatReservation = PublicTransportOptions(rawValue: 1 << 4)
}

func displayTransportOptions(_ options: PublicTransportOptions) {
    if options.contains(.bus) {
        print("Bus is available for this route.")
    }
    if options.contains(.train) {
        print("Train is available for this route.")
    }
    if options.contains(.tram) {
        print("Tram is available for this route.")
    }
    if options.contains(.bikeStorage) {
        print("Bike storage is available.")
    }
    if options.contains(.seatReservation) {
        print("Seat reservation is available.")
    }
}

do {
    let opt1: PublicTransportOptions = [.bus, .train, .bikeStorage]
    displayTransportOptions(opt1)

    let opt2: PublicTransportOptions = [.train, .tram, .seatReservation]
    displayTransportOptions(opt2)
    
    displayTransportOptions([.bikeStorage, .bus, .seatReservation])
    displayTransportOptions(.bus)
}






















// MARK: - Use a Name for Generic Placeholder

/*
 Apple Usage
 */
protocol MyCollection {
    associatedtype Element
    func contains(_ element: Element) -> Bool
}

extension Collection where Element == String {}

struct MyArray<Element: Equatable>: MyCollection {
    var storage: [Element]
    func contains(_ element: Element) -> Bool {
        storage.contains(element)
    }
}

enum MyResult<Success, Failure: Error> {
    case success(Success)
    case failure(Failure)
}

extension Result where Success == String {}

enum MyOptional<Wrapped> {
    case none
    case some(Wrapped)
}

extension Optional where Wrapped == String {}

/*
 Real World Objects
 */
protocol School {
    associatedtype EnrolledStudent
    var name: String { get }
    var students: [EnrolledStudent] { get set }
    mutating func enroll(_ student: EnrolledStudent)
    func listStudents()
}

struct Student {
    let id: Int
    let name: String
}

struct HighSchool<EnrolledStudent>: School {
    var name: String
    var students: [EnrolledStudent] = []

    mutating func enroll(_ student: EnrolledStudent) {
        students.append(student)
    }

    func listStudents() {
        students.forEach { print($0) }
    }
}

struct College<EnrolledStudent>: School {
    var name: String
    var students: [EnrolledStudent] = []

    mutating func enroll(_ student: EnrolledStudent) {
        students.append(student)
    }

    func listStudents() {
        students.forEach { print($0) }
    }
}

do {
    var hs = HighSchool<Student>(name: "Cupertino High")
    hs.enroll(Student(id: 1, name: "Ari"))
    hs.listStudents()

    var csCollege = College<String>(name: "Swift University")
    csCollege.enroll("Charlie")
    csCollege.listStudents()
}






















// MARK: - Make a Delegate or Closure

/*
  Apple Usage
 */
final class SimpleCollectionViewController: UIViewController {

    private let items = ["🍎", "🍊", "🍋", "🍉", "🍇", "🍓"]
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return collectionView
    }()
}

extension SimpleCollectionViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        return cell
    }
}

final class FruitCollectionViewController: UIViewController {

    enum Section {
        case main
    }

    struct Fruit: Hashable {
        let id = UUID()
        let name: String
    }

    private let fruits = [
        Fruit(name: "🍎 Apple"),
        Fruit(name: "🍊 Orange"),
        Fruit(name: "🍋 Lemon"),
        Fruit(name: "🍉 Watermelon"),
        Fruit(name: "🍇 Grapes"),
        Fruit(name: "🍓 Strawberry")
    ]

    private var collectionView: UICollectionView!
    private var dataSource: UICollectionViewDiffableDataSource<Section, Fruit>?

    private func configureCollectionView() {
        let layout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }

    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Fruit>(
            collectionView: collectionView
        ) { collectionView, indexPath, fruit in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
            return cell
        }
    }
}


/*
  Real World Objects
 */
do {
    protocol HomeworkDelegate: AnyObject {
        func remindAboutHomework()
    }

    final class StudentForHomework {
        weak var delegate: HomeworkDelegate?
        func study() {
            print("Studying hard!")
            delegate?.remindAboutHomework()
        }
    }

    final class Assistant: HomeworkDelegate {
        func remindAboutHomework() {
            print("Don't forget to complete your homework!")
        }
    }
    
    let student = StudentForHomework()
    let assistant = Assistant()
    student.delegate = assistant
    student.study()
}


do {
    let remindAboutHomework: () -> Void = {
        print("Don't forget to complete your homework!")
    }

    func study(with reminder: () -> Void) {
        print("Studying hard!")
        reminder()
    }

    study(with: remindAboutHomework)
}
