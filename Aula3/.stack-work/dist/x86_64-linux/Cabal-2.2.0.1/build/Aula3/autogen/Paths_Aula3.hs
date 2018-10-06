{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_Aula3 (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/andre/Documentos/ufabc/CursoHaskell/Aula3/.stack-work/install/x86_64-linux/lts-12.11/8.4.3/bin"
libdir     = "/home/andre/Documentos/ufabc/CursoHaskell/Aula3/.stack-work/install/x86_64-linux/lts-12.11/8.4.3/lib/x86_64-linux-ghc-8.4.3/Aula3-0.1.0.0-BjUogb0VFpjexebRrQZYG-Aula3"
dynlibdir  = "/home/andre/Documentos/ufabc/CursoHaskell/Aula3/.stack-work/install/x86_64-linux/lts-12.11/8.4.3/lib/x86_64-linux-ghc-8.4.3"
datadir    = "/home/andre/Documentos/ufabc/CursoHaskell/Aula3/.stack-work/install/x86_64-linux/lts-12.11/8.4.3/share/x86_64-linux-ghc-8.4.3/Aula3-0.1.0.0"
libexecdir = "/home/andre/Documentos/ufabc/CursoHaskell/Aula3/.stack-work/install/x86_64-linux/lts-12.11/8.4.3/libexec/x86_64-linux-ghc-8.4.3/Aula3-0.1.0.0"
sysconfdir = "/home/andre/Documentos/ufabc/CursoHaskell/Aula3/.stack-work/install/x86_64-linux/lts-12.11/8.4.3/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "Aula3_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "Aula3_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "Aula3_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "Aula3_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "Aula3_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "Aula3_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
