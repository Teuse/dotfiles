import os

def chdir(debugger, args, result, dict):
    """Change the working directory, or cd to ${HOME}."""
    dir = args.strip()
    if dir:
        os.chdir(args)
    else:
        os.chdir(os.path.expanduser('~'))
    print "Current working directory: %s" % os.getcwd()


def findPath(pathExt):
    """Change the working directory to maschine resource folder.  """
    curPath = os.getcwd()
    userDir = os.path.expanduser("~")
    breakIdx = 5

    while breakIdx and curPath and curPath != "/" and curPath != userDir:
        resPath = os.path.join(curPath, pathExt)
        if os.path.exists(resPath):
            return resPath
        breakIdx = breakIdx - 1
        curPath = os.path.dirname(curPath)
    print "Error: Resouce folder not found"
    return ""


def mas_resources_old(debugger, args, result, dict):
    """Change the working directory to maschine resource folder.  """
    thePath = findPath('maschine/resources/maschine')
    if thePath:
        chdir(debugger, thePath, result, dict)


def mas_resources(debugger, args, result, dict):
    """Change the working directory to maschine/kk resource folder.  """
    thePath = findPath('maschine/resources')
    if thePath:
        chdir(debugger, thePath, result, dict)

