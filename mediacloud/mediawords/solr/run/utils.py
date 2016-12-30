import errno
import os
import tempfile
import time

from mediawords.util.log import create_logger
from mediawords.util.paths import file_extension
from mediawords.util.process import run_command_in_foreground

l = create_logger(__name__)


def lock_file(path: str, timeout: int = None) -> None:
    """Create lock file."""
    start_time = time.time()
    l.debug("Creating lock file '%s'..." % path)
    while True:
        try:
            os.open(path, os.O_CREAT | os.O_EXCL | os.O_RDWR)
            break
        except OSError as e:
            if e.errno == errno.EEXIST:
                if timeout is not None:
                    if (time.time() - start_time) >= timeout:
                        raise Exception("Unable to create lock file '%s' in %d seconds." % (path, timeout))

                l.info("Lock file '%s' already exists, will retry shortly." % path)
                time.sleep(1)
            else:
                # Some other I/O error
                raise
    l.debug("Created lock file '%s'" % path)


def unlock_file(path: str) -> None:
    """Remove lock file."""
    l.debug("Removing lock file '%s'..." % path)
    if not os.path.isfile(path):
        raise Exception("Lock file '%s' does not exist." % path)
    os.unlink(path)
    l.debug("Removed lock file '%s'." % path)


def download_file(source_url: str, target_path: str) -> None:
    """Download URL to path."""
    args = ["curl",
            "--silent",
            "--show-error",
            "--retry", "3",
            "--retry-delay", "5",
            "--output", target_path,
            source_url]
    run_command_in_foreground(args)


def download_file_to_temp_path(source_url: str) -> str:
    """Download URL to temporary path, return that path."""
    dest_dir = tempfile.mkdtemp()
    dest_path = os.path.join(dest_dir, 'archive.tgz')
    download_file(source_url=source_url, target_path=dest_path)
    return dest_path


def extract_zip_to_directory(archive_file: str, dest_directory: str) -> None:
    """Extract ZIP archive (.zip or .war) to destination directory."""

    archive_file_extension = file_extension(archive_file)
    if archive_file_extension not in [".zip", ".war"]:
        raise Exception("Unsupported archive '%s' with extension '%s'" % (archive_file, archive_file_extension))

    args = ["unzip", "-q",
            archive_file,
            "-d", dest_directory]

    run_command_in_foreground(args)
