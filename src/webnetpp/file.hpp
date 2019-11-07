#include <mutex>
#include <string>
#include <iomanip>
#include <cstring>

class SynchronizedFile {
public:
    SynchronizedFile (std::ostream& path) : _path(&path) {
    }
    SynchronizedFile () : _path(nullptr) {
    }

    SynchronizedFile& operator = (SynchronizedFile&& sf) {
        _path = sf._path;
        return *this;
    }

    friend SynchronizedFile& operator << (SynchronizedFile&,  const char*);
    friend SynchronizedFile& operator << (SynchronizedFile&,  const std::string&);
    friend SynchronizedFile& operator << (SynchronizedFile&,  const int&);
    friend SynchronizedFile& operator << (SynchronizedFile&,  const double&);

private:
    std::ostream* _path;
    std::mutex _writerMutex;
};

SynchronizedFile& operator << (SynchronizedFile& file,  const char* val)
{
    // Ensure that only one thread can execute at a time
    std::lock_guard<std::mutex> lock(file._writerMutex);

    (*file._path) << val;
    (*file._path).flush();

    return file;
}

SynchronizedFile& operator << (SynchronizedFile& file,  const std::string& val)
{
    // Ensure that only one thread can execute at a time
    std::lock_guard<std::mutex> lock(file._writerMutex);

    for (auto& x : val)
        (*file._path) << x;
    (*file._path).flush();

    return file;
}

SynchronizedFile& operator << (SynchronizedFile& file,  const int& val)
{
    // Ensure that only one thread can execute at a time
    std::lock_guard<std::mutex> lock(file._writerMutex);

    (*file._path) << val;
    (*file._path).flush();

    return file;
}

SynchronizedFile& operator << (SynchronizedFile& file,  const double& val)
{
    // Ensure that only one thread can execute at a time
    std::lock_guard<std::mutex> lock(file._writerMutex);

    (*file._path) << std::setprecision(19) << val;
    (*file._path).flush();

    return file;
}