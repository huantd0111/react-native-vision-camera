//
//  PixelFormat.swift
//  VisionCamera
//
//  Created by Marc Rousavy on 17.08.23.
//  Copyright © 2023 mrousavy. All rights reserved.
//

import Foundation
import AVFoundation

enum PixelFormat {
  case yuv
  case rgb
  case dng
  case native
  case unknown
  
  init(unionValue: String) throws {
    switch(unionValue) {
    case "yuv":
      self = .yuv
    case "rgb":
      self = .rgb
    case "dng":
      self = .dng
    case "native":
      self = .native
    case "unknown":
      self = .unknown
    default:
      throw CameraError.parameter(.invalid(unionName: "pixelFormat", receivedValue: unionValue))
    }
  }
  
  init(mediaSubType: OSType) throws {
    switch(mediaSubType) {
    case kCVPixelFormatType_420YpCbCr8BiPlanarFullRange:
      self = .yuv
    case kCVPixelFormatType_420YpCbCr8BiPlanarVideoRange:
      self = .yuv
    case kCVPixelFormatType_32BGRA:
      self = .rgb
    default:
      self = .unknown
    }
  }
}