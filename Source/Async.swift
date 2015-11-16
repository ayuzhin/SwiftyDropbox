
/* Autogenerated. Do not edit. */

import Foundation
/**
    Datatypes and serializers for the async namespace
*/
public class Async {
    /**
        Result returned by methods that launch an asynchronous job. A method who may either launch an asynchronous job,
        or complete the request synchronously, can use this union by extending it, and adding a 'complete' field with
        the type of the synchronous response. See LaunchEmptyResult for an example.
    */
    public enum LaunchResultBase: CustomStringConvertible {
        /**
            This response indicates that the processing is asynchronous. The string is an id that can be used to obtain
            the status of the asynchronous job.
        */
        case AsyncJobId(String)
        public var description : String {
            return "\(prepareJSONForSerialization(LaunchResultBaseSerializer().serialize(self)))"
        }
    }
    public class LaunchResultBaseSerializer: JSONSerializer {
        public init() { }
        public func serialize(value: LaunchResultBase) -> JSON {
            switch value {
                case .AsyncJobId(let arg):
                    var d = ["async_job_id": Serialization._StringSerializer.serialize(arg)]
                    d[".tag"] = .Str("async_job_id")
                    return .Dictionary(d)
            }
        }
        public func deserialize(json: JSON) -> LaunchResultBase {
            switch json {
                case .Dictionary(let d):
                    let tag = Serialization.getTag(d)
                    switch tag {
                        case "async_job_id":
                            let v = Serialization._StringSerializer.deserialize(d["async_job_id"] ?? .Null)
                            return LaunchResultBase.AsyncJobId(v)
                        default:
                            fatalError("Unknown tag \(tag)")
                    }
                default:
                    fatalError("Failed to deserialize")
            }
        }
    }
    /**
        Result returned by methods that may either launch an asynchronous job or complete synchronously. Upon
        synchronous completion of the job, no additional information is returned.
    */
    public enum LaunchEmptyResult: CustomStringConvertible {
        /**
            The job finished synchronously and successfully.
        */
        case Complete
        public var description : String {
            return "\(prepareJSONForSerialization(LaunchEmptyResultSerializer().serialize(self)))"
        }
    }
    public class LaunchEmptyResultSerializer: JSONSerializer {
        public init() { }
        public func serialize(value: LaunchEmptyResult) -> JSON {
            switch value {
                case .Complete:
                    var d = [String : JSON]()
                    d[".tag"] = .Str("complete")
                    return .Dictionary(d)
            }
        }
        public func deserialize(json: JSON) -> LaunchEmptyResult {
            switch json {
                case .Dictionary(let d):
                    let tag = Serialization.getTag(d)
                    switch tag {
                        case "complete":
                            return LaunchEmptyResult.Complete
                        default:
                            fatalError("Unknown tag \(tag)")
                    }
                default:
                    fatalError("Failed to deserialize")
            }
        }
    }
    /**
        Arguments for methods that poll the status of an asynchronous job.

        - parameter asyncJobId: Id of the asynchronous job. This is the value of a response returned from the method
        that launched the job.
    */
    public class PollArg: CustomStringConvertible {
        public let asyncJobId : String
        public init(asyncJobId: String) {
            stringValidator(minLength: 1)(value: asyncJobId)
            self.asyncJobId = asyncJobId
        }
        public var description : String {
            return "\(prepareJSONForSerialization(PollArgSerializer().serialize(self)))"
        }
    }
    public class PollArgSerializer: JSONSerializer {
        public init() { }
        public func serialize(value: PollArg) -> JSON {
            let output = [ 
            "async_job_id": Serialization._StringSerializer.serialize(value.asyncJobId),
            ]
            return .Dictionary(output)
        }
        public func deserialize(json: JSON) -> PollArg {
            switch json {
                case .Dictionary(let dict):
                    let asyncJobId = Serialization._StringSerializer.deserialize(dict["async_job_id"] ?? .Null)
                    return PollArg(asyncJobId: asyncJobId)
                default:
                    fatalError("Type error deserializing")
            }
        }
    }
    /**
        Result returned by methods that poll for the status of an asynchronous job. Unions that extend this union should
        add a 'complete' field with a type of the information returned upon job completion. See PollEmptyResult for an
        example.
    */
    public enum PollResultBase: CustomStringConvertible {
        /**
            The asynchronous job is still in progress.
        */
        case InProgress
        public var description : String {
            return "\(prepareJSONForSerialization(PollResultBaseSerializer().serialize(self)))"
        }
    }
    public class PollResultBaseSerializer: JSONSerializer {
        public init() { }
        public func serialize(value: PollResultBase) -> JSON {
            switch value {
                case .InProgress:
                    var d = [String : JSON]()
                    d[".tag"] = .Str("in_progress")
                    return .Dictionary(d)
            }
        }
        public func deserialize(json: JSON) -> PollResultBase {
            switch json {
                case .Dictionary(let d):
                    let tag = Serialization.getTag(d)
                    switch tag {
                        case "in_progress":
                            return PollResultBase.InProgress
                        default:
                            fatalError("Unknown tag \(tag)")
                    }
                default:
                    fatalError("Failed to deserialize")
            }
        }
    }
    /**
        Result returned by methods that poll for the status of an asynchronous job. Upon completion of the job, no
        additional information is returned.
    */
    public enum PollEmptyResult: CustomStringConvertible {
        /**
            The asynchronous job has completed successfully.
        */
        case Complete
        public var description : String {
            return "\(prepareJSONForSerialization(PollEmptyResultSerializer().serialize(self)))"
        }
    }
    public class PollEmptyResultSerializer: JSONSerializer {
        public init() { }
        public func serialize(value: PollEmptyResult) -> JSON {
            switch value {
                case .Complete:
                    var d = [String : JSON]()
                    d[".tag"] = .Str("complete")
                    return .Dictionary(d)
            }
        }
        public func deserialize(json: JSON) -> PollEmptyResult {
            switch json {
                case .Dictionary(let d):
                    let tag = Serialization.getTag(d)
                    switch tag {
                        case "complete":
                            return PollEmptyResult.Complete
                        default:
                            fatalError("Unknown tag \(tag)")
                    }
                default:
                    fatalError("Failed to deserialize")
            }
        }
    }
    /**
        Error returned by methods for polling the status of asynchronous job.
    */
    public enum PollError: CustomStringConvertible {
        /**
            The job ID is invalid.
        */
        case InvalidAsyncJobId
        /**
            Something went wrong with the job on Dropbox's end. You'll need to verify that the action you were taking
            succeeded, and if not, try again. This should happen very rarely.
        */
        case InternalError
        /**
            An unspecified error.
        */
        case Other
        public var description : String {
            return "\(prepareJSONForSerialization(PollErrorSerializer().serialize(self)))"
        }
    }
    public class PollErrorSerializer: JSONSerializer {
        public init() { }
        public func serialize(value: PollError) -> JSON {
            switch value {
                case .InvalidAsyncJobId:
                    var d = [String : JSON]()
                    d[".tag"] = .Str("invalid_async_job_id")
                    return .Dictionary(d)
                case .InternalError:
                    var d = [String : JSON]()
                    d[".tag"] = .Str("internal_error")
                    return .Dictionary(d)
                case .Other:
                    var d = [String : JSON]()
                    d[".tag"] = .Str("other")
                    return .Dictionary(d)
            }
        }
        public func deserialize(json: JSON) -> PollError {
            switch json {
                case .Dictionary(let d):
                    let tag = Serialization.getTag(d)
                    switch tag {
                        case "invalid_async_job_id":
                            return PollError.InvalidAsyncJobId
                        case "internal_error":
                            return PollError.InternalError
                        case "other":
                            return PollError.Other
                        default:
                            return PollError.Other
                    }
                default:
                    fatalError("Failed to deserialize")
            }
        }
    }
}