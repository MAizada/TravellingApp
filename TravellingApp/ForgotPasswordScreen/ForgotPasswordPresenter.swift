//
//  ForgotPasswordPresenter.swift
//  TravellingApp
//
//  Created by Aizada on 06.05.2024.
//

protocol ForgotPasswordPresenterProtocol: AnyObject {
    var view: ForgotPasswordViewProtocol? { get set }
    var interactor: ForgotPasswordInteractorInputProtocol? { get set }
    var router: ForgotPasswordRouterProtocol? { get set }
    
    func resetPassword(for email: String)
    func passwordResetSuccess()
    func passwordResetFailed(with error: Error)
}

final class ForgotPasswordPresenter: ForgotPasswordPresenterProtocol, ForgotPasswordInteractorOutputProtocol {
    
    weak var view: ForgotPasswordViewProtocol?
    var interactor: ForgotPasswordInteractorInputProtocol?
    var router: ForgotPasswordRouterProtocol?
    
    func resetPassword(for email: String) {
        interactor?.resetPassword(for: email)
    }
    
    func passwordResetSuccess() {
        view?.showPasswordResetSuccessMessage()
    }
    
    func passwordResetFailed(with error: Error) {
        view?.showPasswordResetError(error)
    }
}

