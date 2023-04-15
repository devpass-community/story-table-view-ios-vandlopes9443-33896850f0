import UIKit

final class MainView: UIView {
        
    lazy var tableView: UITableView = {
       
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.dataSource = self
        return view
    }()
    
    private var items: [String] = []

    init() {

        super.init(frame: .zero)

        self.setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MainView {
    
    func updateView(items: [String]) {
        
        self.items = items
        tableView.reloadData()
    }
}

extension MainView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        cell.textLabel?.text = items[indexPath.row].description
        return cell
    }
}

private extension MainView {

    func setupViews() {

        self.backgroundColor = .white

        self.configureSubviews()
        self.configureSubviewsConstraints()
    }

    func configureSubviews() {
        
        addSubview(tableView)
    }

    func configureSubviewsConstraints() {

        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
