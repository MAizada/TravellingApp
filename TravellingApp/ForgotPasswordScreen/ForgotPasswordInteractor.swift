//
//  ForgotPasswordInteractor.swift
//  TravellingApp
//
//  Created by Aizada on 06.05.2024.
//

import UIKit

protocol ForgotPasswordInteractorOutputProtocol: AnyObject {
    func passwordResetSuccess()
    func passwordResetFailed(with error: Error)
}

protocol ForgotPasswordInteractorInputProtocol: AnyObject {
    var presenter: ForgotPasswordInteractorOutputProtocol? { get set }
    
    func resetPassword(for email: String)
}

final class ForgotPasswordInteractor: ForgotPasswordInteractorInputProtocol {
    weak var presenter: ForgotPasswordInteractorOutputProtocol?
    
    func resetPassword(for email: String) {
        // Ваша логика для сброса пароля здесь
        // Например, отправка запроса на сервер, чтобы сбросить пароль
        // После завершения процесса, вызов методов presenter
    }
}

