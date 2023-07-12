import 'dart:io';

class ApiStatus {
  static List successStatus = [
    HttpStatus.ok,
    HttpStatus.accepted,
    HttpStatus.nonAuthoritativeInformation,
    HttpStatus.noContent,
    HttpStatus.multiStatus,
    HttpStatus.imUsed,
    HttpStatus.created,
    HttpStatus.alreadyReported,
    HttpStatus.partialContent
  ];
  static List errorStatus = [
    HttpStatus.badRequest,
    HttpStatus.clientClosedRequest,
    HttpStatus.conflict,
    HttpStatus.connectionClosedWithoutResponse,
    HttpStatus.expectationFailed,
    HttpStatus.failedDependency,
    HttpStatus.forbidden,
    HttpStatus.gone,
    HttpStatus.lengthRequired,
    HttpStatus.locked,
    HttpStatus.methodNotAllowed,
    HttpStatus.misdirectedRequest,
    HttpStatus.notAcceptable,
    HttpStatus.notFound,
    HttpStatus.paymentRequired,
    HttpStatus.preconditionFailed,
    HttpStatus.preconditionRequired,
    HttpStatus.proxyAuthenticationRequired,
    HttpStatus.upgradeRequired,
    HttpStatus.unsupportedMediaType,
    HttpStatus.unprocessableEntity,
    HttpStatus.unavailableForLegalReasons,
    HttpStatus.unauthorized,
    HttpStatus.tooManyRequests,
    HttpStatus.requestUriTooLong,
    HttpStatus.requestTimeout,
    HttpStatus.requestHeaderFieldsTooLarge,
    HttpStatus.requestEntityTooLarge,
    HttpStatus.requestedRangeNotSatisfiable,
    HttpStatus.proxyAuthenticationRequired,
    HttpStatus.preconditionRequired,
    HttpStatus.preconditionFailed,
  ];
}
