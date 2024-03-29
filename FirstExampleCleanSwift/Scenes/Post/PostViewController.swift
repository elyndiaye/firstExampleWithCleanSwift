//
//  PostViewController.swift
//  FirstExampleCleanSwift
//
//  Created by ely.assumpcao.ndiaye on 01/06/19.
//  Copyright (c) 2019 ely.assumpcao.ndiaye. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol PostDisplayLogic: class
{
    func displaySomething(viewModel: PostScene.Load.ViewModel)
    //Função responsavel por realizar a mudanca da Tela e parametro de para qual tela migrar
    func displayComments(viewModel: PostScene.Comments.ViewModel)
}

class PostViewController: UIViewController, PostDisplayLogic
{
    var interactor: PostBusinessLogic?
    var router: (NSObjectProtocol & PostRoutingLogic & PostDataPassing)?
    //instacia/declaracao do PostView onde tem o layout da tabela intanciamos aqui onde podemos alem de usar tbm passar informacoes
    let postView = CommonTableView()
    // variavel q recebe informacao do displaysomething
    var arrayPosts = [Post]()
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?){
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup()
    {
        let viewController = self
        let interactor = PostInteractor()
        let presenter = PostPresenter()
        let router = PostRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: View lifecycle
    //LoadView acontece antes do viewDidLoad
    override func loadView() {
        //Estamos deixando a viewdeLoad com as configuracoes da PostView onde temos uma tableView
        view = postView
    }
    
    override func viewDidLoad(){
        //Chamando a tabela com o a cell(atraves do registro do identify)
        postView.tableView.register(PostCell.self, forCellReuseIdentifier: PostCell.cellIdentifier)
        postView.tableView.dataSource = self
        postView.tableView.delegate = self
        
        super.viewDidLoad()
        //doSomething vai carregar os dados incias que sao os POSTES
        doSomething()
    }
    
    // MARK: Do something
    
    //@IBOutlet weak var nameTextField: UITextField!
    //Cria um request que é enviado ao Intercactor
    func doSomething() {
        let request = PostScene.Load.Request()
        interactor?.doLoadInitialData(request: request)
    }
    //funcao para receber o retorno do Presenter
    func displaySomething(viewModel: PostScene.Load.ViewModel) {
        arrayPosts = viewModel.posts
        print("Array:")
        print(arrayPosts)
        postView.tableView.reloadData()
    }
    
    //Funcao do protocolo para exibir o tela de Comentariow
    func displayComments(viewModel: PostScene.Comments.ViewModel) {
        //Primeiro CHamada do router
        router?.routeToComments()
    }
}

//Protocolo da tableview
extension PostViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayPosts.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: PostCell.cellIdentifier, for: indexPath) as? PostCell {
            
            let post = arrayPosts[indexPath.row]
            cell.titleLabel.text = post.title
            cell.contentLabel.text = post.body
            
            return cell
            
        } else {
            return UITableViewCell()
        }
    }
}

extension PostViewController: UITableViewDelegate {
    //Implementando o Clique do botao
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let post = arrayPosts[indexPath.row]
        //Requisicao
        let request = PostScene.Comments.Request(post:post)
        //Chamando o interactor falando que queremos carregar os dados mandando a linha do post na requisicao
        interactor?.doLoadComments(request: request)
        
    }
}
